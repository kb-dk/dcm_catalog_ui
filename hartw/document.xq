xquery version "1.0" encoding "UTF-8";

import module namespace layout="http://kb.dk/this/app/layout" at "./cnw-layout.xqm";

declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";
declare namespace fn="http://www.w3.org/2005/xpath-functions";
declare namespace file="http://exist-db.org/xquery/file";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace app="http://kb.dk/this/app";
declare namespace ft="http://exist-db.org/xquery/lucene";

declare option exist:serialize "method=xml media-type=text/html"; 
declare variable $document := request:get-parameter("doc", "");
declare variable $mode     := request:get-parameter("mode","") cast as xs:string;
declare variable $host     := request:get-header('HOST');

let $list := 
for $doc in collection("/db/hartw/data")
where util:document-name($doc)=$document
return $doc

let $result :=
<html xmlns="http://www.w3.org/1999/xhtml">
  {layout:head("Carl Nielsen Works (CNW)",
	  (<link rel="stylesheet" type="text/css" href="/editor/style/public_list_style.css"/>,
	  <link rel="stylesheet" type="text/css" href="/editor/style/mei_to_html_public.css"/>,
	  <script type="text/javascript" src="/editor/js/toggle_openness.js">{"
	  "}</script>
	  ))}
  <body class="list_files">
    <div id="all">
      {layout:page-head("CNW","Carl Nielsen Works Catalogue")}
      {layout:page-menu($mode)}
      <div id="main">
      {
	for $doc in $list
	let $params := 
	<parameters>
	  <param name="hostname"    value="{$host}"/>
	  <param name="script_path" value="./document.xq"/>
	  <param name="doc" value="{$document}"/>
	</parameters>
	return transform:transform($doc,xs:anyURI(concat("http://",$host,"/editor/transforms/mei/mei_to_html_public.xsl")),$params)
      }
      </div>
      {layout:page-footer($mode)}
    </div>
  </body>
</html>
 
return $result
