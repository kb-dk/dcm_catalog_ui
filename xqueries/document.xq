xquery version "1.0" encoding "UTF-8";

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


let $list := 
for $doc in collection("/db/cnw/data")
where util:document-name($doc)=$document
return $doc

let $params := 
<parameters>
   <param name="hostname"    value="{request:get-header('HOST')}"/>
   <param name="script_path" value="/storage/cnw/document.xq"/>
   <param name="doc" value="{$document}"/>
</parameters>

for $doc in $list
return transform:transform($doc,xs:anyURI(concat("","http://",request:get-header('HOST'),"/editor/transforms/mei/mei_to_html_public.xsl")),$params)
 
