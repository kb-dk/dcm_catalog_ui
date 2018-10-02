xquery version "1.0" encoding "UTF-8";

import module namespace layout="http://kb.dk/this/app/layout" at "./layout.xqm";

declare namespace h="http://www.w3.org/1999/xhtml";
declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";
declare namespace fn="http://www.w3.org/2005/xpath-functions";
declare namespace file="http://exist-db.org/xquery/file";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace app="http://kb.dk/this/app";
declare namespace ft="http://exist-db.org/xquery/lucene";
declare namespace m="http://www.music-encoding.org/ns/mei";

declare option exist:serialize "method=xml media-type=text/html"; 

declare variable $document := request:get-parameter("doc", "");
declare variable $mode     := request:get-parameter("mode","nomode") cast as xs:string;
declare variable $host     := request:get-header('HOST');
declare variable $language := request:get-parameter("language", "");
declare variable $score    := request:get-parameter("score", "");

declare variable $coll     := request:get-parameter("c","") cast as xs:string;
declare variable $database := concat("/db/data-",$coll,"/");
declare variable $xsl    := xs:anyURI(concat('http://',$host,"/dcm/",$coll,"/style/transforms/mei_to_html_public.xsl"));

let $list := 
for $doc in collection($database)
where util:document-name($doc)=$document
return $doc

let $c := $list//m:fileDesc/m:seriesStmt/m:identifier[@type="file_collection"][1]/string()
(:  should be: 
    let $work_number := $list//m:meiHead/m:workDesc/m:work[1]/m:identifier[@label=$c][1]/string()
    but that sometimes (apparently randomly) returns 2 results instead of one!? 
    so we need to use the following workaround :)
let $work_number := $list//m:meiHead/m:workDesc/m:work[1]/m:identifier/@label[.=$c]/../string()    
let $title := $list//m:workDesc/m:work[1]/m:titleStmt[1]/m:title[string()][not(@type/string())][1]/string()
let $html := doc(concat("/db/cat-site/",$coll,"/document.html"))
let $head_title := 
   fn:concat($title," – ",$c," ",$work_number," – ",$html//h:title/text())
let $verovio := if($list//m:incip/m:score/* or normalize-space(//m:incipCode[@form='pae' or @form='PAE' or @form='plaineAndEasie']/text())) then true() else false()

let $result :=
<html xmlns="http://www.w3.org/1999/xhtml">
  {layout:head($head_title,
	  (<link rel="stylesheet" type="text/css" href="style/mei_to_html_public.css"/>,
	  <script type="text/javascript" src="js/toggle_openness.js">{"
	  "}</script>
	  ),
	  $verovio)}
  <body class="list_files">
    <div id="all">
      {layout:page-head-doc($html)}
      {layout:page-menu($mode)}
      <div id="main">
      {
	for $doc in $list
	let $params := 
	<parameters>
	  <param name="hostname"    value="{$host}"/>
	  <param name="script_path" value="./document.xq"/>
	  <param name="doc" value="{util:document-name($doc)}"/>
	  <param name="cat" value="{$coll}"/>
      <param name="language" value="{$language}"/>
      <param name="score" value="{$score}"/>
	</parameters>
	return transform:transform($doc,$xsl,$params)
      }
      </div>
      {layout:page-footer($mode)}
    </div>

  </body>

</html>
 
return $result
