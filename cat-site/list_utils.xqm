xquery version "1.0" encoding "UTF-8";

module namespace  app="http://kb.dk/this/listapp";

import module namespace  forms="http://kb.dk/this/formutils" at "./form_utils.xqm";

declare namespace file="http://exist-db.org/xquery/file";
declare namespace fn="http://www.w3.org/2005/xpath-functions";
declare namespace ft="http://exist-db.org/xquery/lucene";
declare namespace ht="http://exist-db.org/xquery/httpclient";
declare namespace m="http://www.music-encoding.org/ns/mei";
declare namespace h="http://www.w3.org/1999/xhtml";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace xl="http://www.w3.org/1999/xlink";

declare variable $app:notbefore:= request:get-parameter("notbefore","") cast as xs:string;
declare variable $app:notafter := request:get-parameter("notafter","") cast as xs:string;
declare variable $app:query    := request:get-parameter("query","");
declare variable $app:page     := request:get-parameter("page","1") cast as xs:integer;
declare variable $app:number   := request:get-parameter("itemsPerPage","20") cast as xs:integer;
declare variable $app:genre    := request:get-parameter("genre","") cast as xs:string;
declare variable $app:sortby   := request:get-parameter("sortby","null,work_number") cast as xs:string;

declare variable $app:title    := request:get-parameter("title", "") cast as xs:string;
declare variable $app:name     := request:get-parameter("name", "") cast as xs:string;
declare variable $app:scheme   := request:get-parameter("scheme","") cast as xs:string;
declare variable $app:workno   := request:get-parameter("workno", "") cast as xs:string;

declare variable $app:from     := ($app:page - 1) * $app:number + 1;
declare variable $app:to       :=  $app:from      + $app:number - 1;
declare variable $app:view     := request:get-parameter("view","") cast as xs:string;
declare variable $app:anthologies := request:get-parameter("anthologies","") cast as xs:string;



declare function app:generate-href($field as xs:string,
  $value as xs:string) as xs:string {
    let $inputs := forms:pass-as-hidden()
    let $pars   :=
        for $inp in $inputs[@value/string()]
        let $str:=
          if($field = $inp/@name/string() ) then
                if ($value != "") then
            	    string-join(($field,fn:escape-uri($value,true())),"=")
                else
                    ""
          else
        	string-join(($inp/@name,fn:escape-uri($inp/@value,true())),"=")
    	return $str

  let $link := string-join($pars,"&amp;")
  return $link

};

declare function app:get-work-number($doc as node() ) as xs:string* {
  (: Returns only the number part of the full work, e.g. '12' or 'Coll. 2' :)
  let $c := 
    $doc//m:fileDesc/m:seriesStmt/m:identifier[@type/string()='file_collection'][1]/string()
  let $no := $doc//m:meiHead/m:workList/m:work[1]/m:identifier[@label/string()=$c][1]/string() 
  return ($no)	
};


declare function app:get-edition-and-number($doc as node() ) as xs:string* {
  (: Returns a formatted string containing the full work reference (list name and identifying number, e.g. CNW 12) :)
  let $c := 
    $doc//m:fileDesc/m:seriesStmt/m:identifier[@type/string()='file_collection'][1]/string()
  (: was: 
  let $c := $doc//m:fileDesc/m:seriesStmt/m:identifier[@type="file_collection"][1]/string() :)
  (: was:
  let $no := $doc//m:meiHead/m:workList/m:work[1]/m:identifier[@label[.=$c]]/string() :)
  let $no := $doc//m:meiHead/m:workList/m:work[1]/m:identifier[@label/string()=$c][1]/string() 
    (: shorten very long identifiers (i.e. lists of numbers) :)
    let $part1 := substring($no, 1, 11)
    let $part2 := substring($no, 12)
    let $delimiter := substring(concat(translate($part2,'0123456789',''),' '),1,1)
  let $n := 
    if (string-length($no)>11) then 
      concat($part1,substring-before($part2,$delimiter),'...')
    else
      $no

  return ($c, $n)	
};

declare function app:view-document-reference($doc as node()) as node() {
  let $ref := 
  <h:a  target="_blank"
  title="View" 
  href="present.xq?doc={util:document-name($doc)}">Title here &lt;&lt;
    {$doc//m:workList/m:work[@analog="frbr:work"]/m:title[1]/string()}
  </h:a>
  return $ref
};

declare function app:public-view-document-reference($doc as node()) as node()* {
  let $langs :=
    comment{
      for $lang in distinct-values($doc//m:workList/m:work[1]/m:title[string()]/@xml:lang/string())
      return $lang
    }
    let $ref := 
      ($langs,
      element h:span {
	attribute lang {$doc//m:workList/m:work[1]/m:title[string()][not(@type/string())][1]/@xml:lang},
	$doc//m:workList/m:work[1]/m:title[string()][not(@type/string())][1]/string(),
	" ",
	element h:span {
	  attribute class {"list_subtitle"},
	  if ($doc//m:workList/m:work[1]/m:title[string()][@type/string()='subordinate'][1]/string()) 
	  then
	     element h:span {
	        " | ",
	        $doc//m:workList/m:work[1]/m:title[string()][@type/string()='subordinate'][1]/string()
	     }
	  else if ($doc//m:workList/m:work[1]/m:title[@type/string()='alternative'][1]/string()) 
	     then concat( '(',$doc//m:workList/m:work[1]/m:title[string()][@type/string()='alternative'][1]/string(),')') else ""
	}
      },
    element h:br {},
    element h:span {
	  attribute class {"alternative_language"},
	  attribute lang {"en"},
	  concat($doc//m:workList/m:work[1]/m:title[string()][@xml:lang='en' and not(@type/string())][1]/string()," "),
  	  element h:span {
  	  attribute class {"list_subtitle"},
	  if ($doc//m:workList/m:work[1]/m:title[string()][@xml:lang='en' and @type/string()='subordinate'][1]/string())
	  then 
	     element h:span {
	        " | ",
	        $doc//m:workList/m:work[1]/m:title[string()][@xml:lang='en' and @type/string()='subordinate'][1]/string()
	     }
	  else ""
	}
      }
      )
      return $ref
};
    

declare function app:navigation( 
  $sort-options as node()*,
  $list as node()* ) as node()*
{

  let $total := fn:count($list/m:meiHead)
  let $total_pages := fn:ceiling($total div $app:number)
  let $page := if ($app:page > $total_pages) then $total_pages else $app:page
  let $uri   := "" 
  let $nextpage := ($page+1) cast as xs:string

  let $next     :=
    if($app:from + $app:number <$total) then
      (element h:a {
    	attribute rel   {"next"},
    	attribute title {"Go to next page"},
    	attribute class {"paging"},
    	attribute href {
    	  fn:string-join((
    	    $uri,"?",
    	    app:generate-href("page",$nextpage)),"")
    	},
		<svg width="12" height="20" version="1.1" viewBox="2 1 3 3.5" xmlns="http://www.w3.org/2000/svg">
            <g>
                <path d="m4.4979 3.175-2.1167 1.5875v-3.175z" stroke-width=".70201"/>
            </g>
        </svg>
      })
    else
      ("") 

    let $prevpage := ($page - 1) cast as xs:string

    let $previous :=
      if($app:from - $app:number + 1 > 0) then
	(
	  element h:a {
	    attribute rel {"prev"},
	    attribute title {"Go to previous page"},
	    attribute class {"paging"},
	    attribute href {
       	      fn:string-join(
		($uri,"?",
		app:generate-href("page",$prevpage)),"")},
		<svg width="12" height="20" version="1.1" viewBox="1 1 3 3.5" xmlns="http://www.w3.org/2000/svg">
            <g transform="translate(3.175 3.175) scale(-1 1) translate(-3.175 -3.175)">
                <path d="m4.4979 3.175-2.1167 1.5875v-3.175z" stroke-width=".70201"/>
            </g>
        </svg>
	  })
	else
	  ("") 



	  let $app:page_nav := 
	    (element h:div {
	        attribute id {"total_pages"},
	        element h:input {
    	      attribute class {"paging"},
    	      attribute id {"current_page"},
    	      attribute onchange {
                fn:string-join(("location.href='", $uri, "?", app:generate-href("page",""), "&amp;page=' + this.value;"),"")    	          
    	      },
    	      attribute value {$page}
    	    }
	    }
	    )

(: 
	  let $app:page_nav := for $p in 1 to fn:ceiling( $total div $app:number ) cast as xs:integer
	  return 
	    (if(not($app:page = $p)) then
	    element h:a {
	      attribute title {"Go to page ",xs:string($p)},
	      attribute class {"paging"},
	      attribute href {
       		fn:string-join(
		  ($uri,"?",
		  app:generate-href("page",xs:string($p))),"")
	      },
	      ($p)
	    }
	  else 
	    element h:span {
	      attribute class {"paging selected"},
	      ($p)
	    }
	  )
:)
    

      let $work := 
		if($total=1) then
		  " work"
		else
		  " works"

            let $links := ( 
	      element h:div {
    		element h:strong {
    		  attribute id {"works_found"},
    		  attribute class {"navigation_label"},
    		  "Found ",$total, $work
    		},
    		if($sort-options) then
    		  (<h:form action="" id="sortForm" style="display:inline;float:right;">
    		  <h:label for="sortby" class="navigation_label">Sort by </h:label>
    		  <h:select name="sortby" id="sortby" onchange="this.form.elements['page'].value = '1';this.form.submit();return true;"> 
    		    {
    		      for $opt in $sort-options
    		      let $option:=
    			if($opt/@value/string()=$app:sortby) then
    			  element h:option {
    			    attribute value {$opt/@value/string()},
    			    attribute selected {"selected"},
    			    $opt/string()}
    			  else
    			    element h:option {
    			      attribute value {$opt/@value/string()},$opt/string()}
       			      return $option
    		    }
    		  </h:select>
    		  {forms:pass-as-hidden-except("sortby")}
    		  </h:form>)
    		else
    		  (),
		  (<h:form action="" id="itemsPerPageForm" style="display:inline;float:right;">
		  <h:label for="itemsPerPage" class="navigation_label">Results per page: </h:label>
		  <h:select name="itemsPerPage" id="itemsPerPage" onchange="this.form.elements['page'].value = '1';this.form.submit();return true;"> 
		    {(
		      element h:option {attribute value {"10"},
		      if($app:number=10) then 
			attribute selected {"selected"}
		      else
			"",
			"10"},
			element h:option {attribute value {"20"},
			if($app:number=20) then 
			  attribute selected {"selected"}
			else
			  "",
			  "20"},
			  element h:option {attribute value {"50"},
			  if($app:number=50) then 
			    attribute selected {"selected"}
			  else
			    "",
			    "50"},
			    element h:option {attribute value {"100"},
			    if($app:number=100) then 
			      attribute selected {"selected"}
			    else
			      "",
			      "100"},
			      element h:option {attribute value {$total cast as xs:string},
			      if($app:number=$total or $app:number>$total) then 
				attribute selected {"selected"}
			      else
				"",
				"all"}
		    )}
		  </h:select>

		  {forms:pass-as-hidden-except("itemsPerPage")}
		      
		  </h:form>),
		  <h:br/>,
		  if ($total > $app:number) then
		    element h:div {
       		      attribute class {"paging_div noprint"},
        	      element h:label {
    	              attribute for {"current_page"},
    	              attribute class {"navigation_label"},
    	              "Page "
        	      },
       		      $previous,"&#160;",
       		      $app:page_nav,
       		      "&#160;", 
       		      $next,
		          element h:span {
		              attribute class {"navigation_label"},
    		          " of ",
    		          fn:ceiling($total div $app:number)
		          }
		    }
       		    else "",
		      element h:br {
			attribute clear {"both"}
		      }
})
return $links
 };
