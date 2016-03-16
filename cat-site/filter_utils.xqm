xquery version "1.0" encoding "UTF-8";

module  namespace filter="http://kb.dk/this/app/filter";

import module namespace  forms="http://kb.dk/this/formutils" at "./form_utils.xqm";
import module namespace  list="http://kb.dk/this/listapp" at "./list_utils.xqm";
declare namespace m="http://www.music-encoding.org/ns/mei";
declare namespace h="http://www.w3.org/1999/xhtml";

declare variable $filter:anthologies := request:get-parameter("anthologies","") cast as xs:string;
declare variable $filter:sortby      := request:get-parameter("sortby", "null,work_number") cast as xs:string;
declare variable $filter:page        := request:get-parameter("page",   "1") cast as xs:integer;
declare variable $filter:number      := request:get-parameter("itemsPerPage","20") cast as xs:integer;
declare variable $filter:genre       := request:get-parameter("genre", "") cast as xs:string;
declare variable $filter:uri         := "";
declare variable $filter:coll        := request:get-parameter("c","") cast as xs:string;
declare variable $filter:identifiers := doc("/db/cat-site/collections.xml");
declare variable $filter:collection   := $filter:identifiers//*[m:title=$filter:coll]/m:identifier;
declare variable $filter:vocabulary  := doc(concat("/db/cat-site/",$filter:coll,"/keywords.xml"));
declare variable $filter:numnam      := doc(concat("/db/cat-site/",$filter:coll,"/select.xml"));
declare variable $filter:scheme      := request:get-parameter("scheme", upper-case($filter:coll)) cast as xs:string;

declare function filter:print-filters(
  $database        as xs:string,
  $number          as xs:string,
  $genre           as xs:string,
  $query           as xs:string) 
{
  let $notafter  := request:get-parameter("notafter","1931")
  let $notbefore := request:get-parameter("notbefore","1880")
  let $search_help := 
    <a class="help">?<span class="comment"> 
      Search terms may be combined using boolean operators. Wildcards allowed. 
      Search is case insensitive (except for boolean operators, which must be uppercase).
      Some examples:<br/>
      <span class="help_table">
        <span class="help_example">
          <span class="help_label">carl OR nielsen</span>
          <span class="help_value">Boolean OR (default)</span>
        </span>                        
        <span class="help_example">
          <span class="help_label">carl AND nielsen</span>
          <span class="help_value">Boolean AND</span>
        </span>
        <span class="help_example">
          <span class="help_label">"carl nielsen"</span>
          <span class="help_value">Exact phrase</span>
        </span>
        <span class="help_example">
          <span class="help_label">niels*</span>
          <span class="help_value">Match any number of characters. Finds Niels, Nielsen and Nielsson<br/>
          (use only at end of word)
          </span>
        </span>
        <span class="help_example">
          <span class="help_label">niels?n</span>
          <span class="help_value">Match 1 character. Finds Nielsen and Nielson, but not Nielsson</span>
        </span>
      </span>
    </span>
  </a>

  let $filter:=
  <form action="navigation.xq" method="get" class="search" id="query_form" name="query_form">

    {forms:pass-as-hidden-except("notafter notbefore name title genre query scheme workno anthologies")}

    <div class="filter_block">

      <span class="label input_label">Keywords</span>
      <br/>
      <input name="query" 
             class="query_input" 
	     value='{request:get-parameter("query","")}' 
	     id="query_input"/>
        {$search_help}
    </div>

    <div class="filter_block">
      <span class="label input_label">Title</span>
      <br/>
      <input name="title" 
             class="query_input" 
	     value='{request:get-parameter("title","")}' 
	     id="title_input"/>
        {$search_help}
    </div>

    <div class="filter_block">
    <span class="label input_label">Name</span>
    <br/>
    <select id="name_field" name="name" onchange="swap_num_type();return true;">
    {
      for $nam in $filter:numnam//h:select[@id="name_field"]/h:option
	return 
	  if($nam/@value eq request:get-parameter("name", "")) then
	    <option value="{$nam/@value}" selected="selected">{$nam/text()}</option>
	  else
	    <option value="{$nam/@value}">{$nam/text()}</option>
    }
    </select>
    </div>

    <div class="filter_block">
    {

      let $schemeselectors :=
      (<span class="label input_label">Numbers</span>,
      <br/>,
      <select id="scheme_selector" 
              name="scheme" 
              onchange="swap_num_type();return true;">
	{
	  for $numschema in $filter:numnam//h:div[@id="numbers"]/h:select/@id
	  return 
	    if(  $numschema eq request:get-parameter("scheme", $filter:collection)) then
	      <option value="{$numschema}" selected="selected">{$numschema/string()}</option>
	    else
	      <option value="{$numschema}">{$numschema/string()}</option>
	}
      </select>)

      let $numselectors :=
      for $nums in $filter:numnam//h:div[@id="numbers"]/h:select
	let $nam :=
	  if($nums/@id/string() eq request:get-parameter("scheme", $filter:collection)) then 
	    "workno"
	  else
	    "noname"

	let $sty :=
	  if($nums/@id/string() eq request:get-parameter("scheme", $filter:collection)) then 
	    "display:inline;"
	  else
	    "display:none;"

        return 
	<select id="{$nums/@id/string()}" 
	        name="{$nam}" 
		style="{$sty}">
	  { 
          for $opt in $nums/h:option
	  return
	    if(  $opt/@value eq request:get-parameter("workno", "")) then
	    <option value="{$opt/@value}" selected="selected">{$opt/string()}</option>
	    else
	    <option value="{$opt/@value}">{$opt/string()}</option>
	  }
	</select>

	return ($schemeselectors, $numselectors)
      }
    </div>

    <div class="filter_block">
      <span class="label">Year of composition</span>    
      <table cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td style="padding-left: 0;">
            <input id="notbefore" name="notbefore" value="{$notbefore}" onblur="setYearSlider()"/>
          </td>
          <td>
	    <div class="slider" id="year_slider">
	      {" "}
	    </div>
          </td>
          <td>
	    <input id="notafter" 
	    name="notafter" 
	    value="{$notafter}" 
	    onblur="setYearSlider()"/>
          </td>
        </tr>
      </table>
    </div>

    <div class="genre_filter filter_block">
	{
	  for $genre in $filter:vocabulary/m:classification/m:termList[@label="level1" or @label="level2"]/m:term/string()
	    let $selected :=
          if ($genre=$filter:genre) then "selected" else ""

 	return 
	  if ($filter:vocabulary/m:classification/m:termList[m:term/string()=$genre]/@label="level2")
	    then 
	    (  
	      <div class="genre_filter_row">
	         { element input {
	            attribute type {"radio"},
                attribute name {"genre"},
                attribute value {$genre},
                attribute id {concat("id",translate($genre," ",""))},
                attribute class {"radio"},
	           if($selected="selected") then
	            attribute checked {"checked"}
	           else
	            ()
              }
	       }
           <label for="{concat('id',translate($genre,' ',''))}" class="level2 {$selected}">
              <span><span class="genre_indicator {translate(translate($genre,' ,','_'),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')}">&#160;</span></span> {$genre} 
	       </label>
	     </div>
	    )
          else
          <div class="genre_filter_row">
	      { element input {
	            attribute type {"radio"},
                attribute name {"genre"},
                attribute value {$genre},
                attribute id {concat("id",translate($genre," ",""))},
                attribute class {"checkbox"},
	       if($selected="selected") then
	           attribute checked {"checked"}
	       else
	           ()
           }
	      }
              <label for="{concat('id',translate($genre,' ',''))}" class="level1 {$selected}">
        	      <span><span class="genre_indicator {translate(translate($genre,' ,','_'),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')}">&#160;</span></span> {$genre} 
              </label>
           </div>
        }
         </div>
         
      <div class="filter_block anthologies">
        {     
            element input {
    	    attribute type {"checkbox"},
            attribute name {"anthologies"},
            attribute value {"yes"},
            attribute id {"idAnthologies"},
            attribute class {"checkbox"},
	        if($forms:anthologies="yes") then
	           attribute checked {"checked"}
	        else
	           ()
	        }
        } <label for="idAnthologies"><span><span>&#160;</span></span>Exclude song collections</label>
         </div>

	      <div class="filter_block search_button">
            <input type="submit" value="" class="search_submit" id="search_submit" onclick="this.form.elements['page'].value = '1'; return true();"/>
          </div>
        </form>

    return $filter
};


declare function filter:count-hits(
  $term as xs:string,
  $list as node()*) as xs:integer* 
{
  let $number :=
  for $count in count($list//m:workDesc[contains(m:work/m:classification/m:termList/m:term/string(),$term) ])
    return $count
  return $number
};

declare function filter:filter-elements() 
{
  let $notafter    := request:get-parameter("notafter","")
  let $notbefore   := request:get-parameter("notbefore","")
  let $query       := request:get-parameter("query","")
  let $title       := request:get-parameter("title","")
  let $name        := request:get-parameter("name","")
  let $workno      := request:get-parameter("workno","")
  let $scheme      := request:get-parameter("scheme","")
  let $genre       := request:get-parameter("genre","")
  let $anthologies := request:get-parameter("anthologies","")

  let $this_uri :=  fn:concat($filter:uri,"?",list:generate-href("page","1"))
(:  let $this_uri    := fn:replace(fn:concat($filter:uri,"?",$myuri,'page=[^&amp;]+',''))

  let $this_uri    := fn:replace(fn:concat($myuri,"?",request:get-query-string()),'page=[^&amp;]+','')
:)
 
  let $year_block :=
      if(($notbefore and $notbefore!="1880") or ($notafter and $notafter!="1931")) then
       <a class="filter_element"
           href="{fn:replace(fn:replace(fn:replace($this_uri,'notbefore=[^&amp;]+[&amp;]?',''),'notafter=[^&amp;]+[&amp;]?',''),'[&amp;]$','')}">
           Year of composition: {$notbefore}–{$notafter} 
       </a>
    else
       ""

  let $title_block :=
      if($title) then
       <a class="filter_element"
           href="{fn:replace(fn:replace($this_uri,'title=[^&amp;]+[&amp;]?',''),'[&amp;]$','')}">
           Title: {$title} 
       </a>
    else
       ""

  let $name_block :=
      if($name) then
       <a class="filter_element"
           href="{fn:replace(fn:replace($this_uri,'name=[^&amp;]+[&amp;]?',''),'[&amp;]$','')}">
           Name: {$name} 
       </a>
    else
       ""

  let $query_block :=
      if($query) then
       <a class="filter_element"
           href="{fn:replace(fn:replace($this_uri,'query=[^&amp;]+[&amp;]?',''),'[&amp;]$','')}">
           Keyword(s): {$query} 
       </a>
    else
       ""

    let $workno_block :=
      if($workno) then
       <a class="filter_element"
           href="{fn:replace(fn:replace($this_uri,'workno=[^&amp;]+[&amp;]?',''),'[&amp;]$','')}">
           {$scheme} number: {$workno} 
       </a>
    else
       ""

  let $genre_block :=
      if($genre) then
       <a class="filter_element" 
           href="{fn:replace(fn:replace($this_uri,'genre=[^&amp;]+[&amp;]?',''),'[&amp;]$','')}">
           Genre: {$genre} 
       </a>
       else
       ""

  let $anthology_block :=
      if($anthologies="yes") then
       <a class="filter_element" 
           href="{fn:replace(fn:replace($this_uri,'anthologies=[^&amp;]+[&amp;]?',''),'[&amp;]$','')}">
           Exclude song collections 
       </a>
       else
       ""
  let $reset_block :=
      if($genre_block or $year_block or $query_block or $anthology_block or $title_block or $name_block or $workno_block ) then
       <a class="filter_element reset" 
           href="{fn:concat($filter:uri,'?itemsPerPage=',request:get-parameter("itemsPerPage",""),'&amp;sortby=',request:get-parameter("sortby",$filter:sortby))}">
           Reset all
       </a> 
    else
       ""

  let $clear :=
      <br style="clear:both"/>
  return ($title_block, $query_block, $name_block, $workno_block, $year_block, $genre_block, $anthology_block, $reset_block, $clear)
};



declare function filter:print-filtered-link(
  $database        as xs:string,
  $number          as xs:string,
  $query           as xs:string,
  $term            as xs:string) as node()*
{
  let $link := (
    element a 
    {
      attribute title {"Filter with ",$term},
      attribute href {
	concat($filter:uri,"?",
	  "page=",1,
	  "&amp;itemsPerPage=",$number,
	  "&amp;sortby=",request:get-parameter("sortby",$filter:sortby),
	  "&amp;query=",$query,
	  "&amp;anthologies=",$filter:anthologies,
	  "&amp;notbefore=",request:get-parameter("notbefore",""),
	  "&amp;notafter=",request:get-parameter("notafter",""),
	  "&amp;title=",request:get-parameter("title",""),
	  "&amp;name=",request:get-parameter("name",""),
	  "&amp;scheme=",request:get-parameter("schee",""),
	  "&amp;workno=",request:get-parameter("schee",""),
	  "&amp;genre=",fn:escape-uri($term,true()))},
	  $term
    }
    )
    return $link
};

declare function filter:get-filtered-link(
  $number          as xs:string,
  $query           as xs:string,
  $term            as xs:string) as xs:string
{
  let $link := 
	concat($filter:uri,"?",
	  "page=",1,
	  "&amp;itemsPerPage=",$number,
	  "&amp;sortby=",request:get-parameter("sortby",$filter:sortby),
	  "&amp;query=",$query,
	  "&amp;anthologies=",$filter:anthologies,
	  "&amp;notbefore=",request:get-parameter("notbefore",""),
	  "&amp;notafter=",request:get-parameter("notafter",""),
	  "&amp;title=",request:get-parameter("title",""),
	  "&amp;name=",request:get-parameter("name",""),
	  "&amp;scheme=",request:get-parameter("schee",""),
	  "&amp;workno=",request:get-parameter("schee",""),
	  "&amp;genre=",fn:escape-uri($term,true()))
    return $link
};

