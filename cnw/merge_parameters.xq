xquery version "1.0" encoding "UTF-8";

import module namespace layout="http://kb.dk/this/app/layout" at "./cnw-layout.xqm";

declare option exist:serialize "method=xml media-type=text/html;charset=UTF-8";

declare variable $mode   := request:get-parameter("mode","") cast as xs:string;
declare variable $genre  := request:get-parameter("genre","") cast as xs:string;
declare variable $coll   := request:get-parameter("c",    "CNW") cast as xs:string;
declare variable $query  := request:get-parameter("query","") cast as xs:string;
declare variable $page   := request:get-parameter("page", "1") cast as xs:integer;
declare variable $number := request:get-parameter("itemsPerPage","20") cast as xs:integer;
declare variable $publ   := request:get-parameter("published_only","") cast as xs:string;
declare variable $anthologies := request:get-parameter("anthologies","yes");
declare variable $css    := request:get-parameter("css","/editor/style/mei_to_html_print.css") cast as xs:string;
declare variable $style  := "http://dcm-udv-01.kb.dk/editor/transforms/mei/mei_to_html_print.xsl";
declare variable $database := request:get-parameter("db","/db/cnw/data") cast as xs:string;

let $stURI    := xs:anyURI(request:get-parameter("style",$style))

let $formpage :=
<html xmlns="http://www.w3.org/1999/xhtml">
  {layout:head("Set parameters",())}
  <body class="list_files">
    <div id="all">
      {layout:page-head("&#160;","Generate a merged catalog for offline study or printing")}
      {layout:page-menu($mode)}
      <div id="main">
	<div class="filter">
          <div class="filter_block">
            <form action="./merge_docs.xq"
	          method="get" 
		  class="search" 
		  id="query_form" name="query_form" >

	      <p><strong>Order by</strong><br/>
	      <select name="sortby">
		<option value="null,work_number">Work number</option>
		<option value="null,title">Title</option>
		<option value="date,title">Year</option>
	      </select></p>
	      <p><strong>Genre</strong><br/>
	      <input style="color:black;" type="text" value="{$genre}" name="genre" /></p>
	      <p><strong>Collection</strong><br/>
	      <input style="color:black;" type="text" value="{$coll}"  name="c" /></p>
	      <p><strong>Search query</strong><br/>
	      <input style="color:black;" type="text" value="{$query}" name="query"/></p>
	      <p><strong>Anthologies</strong><br/>
	      <input style="color:black;" 
	             type="text" value="{$anthologies}" name="anthologies"/></p>
	      <p><strong>XSL style sheet URI</strong><br/>
	      <input style="color:black;" type="text" value="{$stURI}" name="style" /></p>
	      <p><strong>eXist database</strong><br/>
	      <input style="color:black;" type="text" value="{$database}" name="db" /></p>
	      <p><strong>CSS style sheet</strong><br/>
	      <input style="color:black;" type="text" value="{$css}"  name="css" /></p>

	      <p><input type="submit" value="Generate" /></p>
	    </form>
	  </div>
	</div>
      </div>
      {layout:page-footer($mode)}
    </div>
  </body>
</html>

return $formpage
