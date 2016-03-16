xquery version "1.0" encoding "UTF-8";

import module namespace layout="http://kb.dk/this/app/layout" at "./layout.xqm";

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
declare variable $mode   := request:get-parameter("mode","") cast as xs:string;

let $list := 
for $doc in collection("/db/cnw/data")
where util:document-name($doc)=$document
return $doc

let $result :=
	for $doc in $list
	let $params := 
	<parameters>
	  <param name="hostname"    value="http://dcm-frontend-01.kb.dk"/>
	  <param name="script_path" value="./document.xq"/>
	  <param name="doc" value="{$document}"/>
	</parameters>
	return transform:transform($doc,xs:anyURI("style/transforms/mei_to_html_print.xsl"),$params)
return $result
