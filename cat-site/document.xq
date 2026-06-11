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

declare option exist:serialize "method=xhtml5 media-type=text/html doctype-public=html";

declare variable $mode     := request:get-parameter("mode","nomode") cast as xs:string;
(: For now, Docker users must hard-code their server's name below. For instance :)
(: declare variable $host     := "catalog.example.org";                         :)
(: Non-Docker users may use "localhost" or possibly request:get-header("HOST")  :)
declare variable $host     := "localhost"; 
declare variable $language := request:get-parameter("language", "");
declare variable $score    := request:get-parameter("score", "");

declare variable $coll     := request:get-parameter("c","") cast as xs:string;
declare variable $database := concat("/db/data-",$coll,"/");
declare variable $xsl      := doc("/db/cat-site/style/transforms/mei_to_html_public.xsl");

(: Parameter 'doc' retrieves document by file name :)
declare variable $document := request:get-parameter("doc", "");
(: Parameter 'n' retrieves document by work number :)
declare variable $n := request:get-parameter("n", "");
(: Optional parameter 'l' in combination with parameter 'n' retrieves document by work number in another list than the primary work numbering (same as 'scheme' in the main loop) :)
declare variable $l := request:get-parameter("l",$coll) cast as xs:string;


let $list :=
    if ($n != "") then
        (:for $doc in collection($database)/m:mei[.//m:work/m:identifier[ft:query(@label,$l) and text()=$n]]:)
        for $doc in collection($database)/m:mei[.//m:work/m:identifier[lower-case(@label)=$l and text()=$n]]
        return $doc
    else 
        for $doc in collection($database)
        where util:document-name($doc)=$document
        return $doc/m:mei

let $html := doc(concat("/db/cat-site/",$coll,"/document.html"))

let $result :=
    if(not(count($list) eq 1)) then
        <h:html xmlns="http://www.w3.org/1999/xhtml" lang="en">
          {layout:head($coll,
        	  (<h:link rel="stylesheet" type="text/css" href="style/mei_to_html_public.css"/>,
        	  <h:script type="text/javascript" src="js/toggle_openness.js">{"
        	  "}</h:script>
        	  ),
        	  false())}
          <h:body class="list_files document">
            <h:div id="all">
              {layout:page-head-doc($html)}
              {layout:page-menu($mode)}
              {if (count($list) eq 0) then
                  <h:div id="main">No matching work found. Please make sure to use valid work identifiers.</h:div>
               else 
                  <h:div id="main">Provided parameters match more than one work. Please make sure to use unique identifiers.</h:div>
              }
              {layout:page-footer($mode)}
            </h:div>
          </h:body>
        </h:html>
    else
        let $c := $list//m:fileDesc/m:seriesStmt/m:identifier[@type="file_collection"][1]/string()
        (:  should be: 
            let $work_number := $list//m:meiHead/m:workList/m:work[1]/m:identifier[@label=$c][1]/string()
            but that sometimes (apparently randomly) returns 2 results instead of one!? 
            so we need to use the following workaround :)
        let $work_number := $list//m:meiHead/m:workList/m:work[1]/m:identifier/@label[.=$c]/../string()    
        let $title := $list//m:workList/m:work[1]/m:title[string()][not(@type/string())][1]/string()
        let $head_title := 
           fn:concat($title," – ",$c," ",$work_number," – ",$html//h:title/text())
        let $verovio := if($list//m:incip/m:score/* or normalize-space(//m:incipCode[@form='pae' or @form='PAE' or @form='plaineAndEasie']/text())) then true() else false()
        return 
            <h:html xmlns="http://www.w3.org/1999/xhtml" lang="en">
              {layout:head($head_title,
            	  (<h:link rel="stylesheet" type="text/css" href="style/mei_to_html_public.css"/>,
            	  <h:script type="text/javascript" src="js/toggle_openness.js">{"
            	  "}</h:script>
            	  ),
            	  $verovio)}
              <h:body class="list_files document">
                <h:div id="all">
                  {layout:page-head-doc($html)}
                  {layout:page-menu($mode)}
                  <h:div id="main">
                  {
            	for $doc in $list
            	let $params := 
            	<h:parameters>
            	  <h:param name="hostname"    value="{$host}"/>
            	  <h:param name="script_path" value="./document.xq"/>
            	  <h:param name="doc"         value="{util:document-name($doc)}"/>
            	  <h:param name="cat"         value="{$coll}"/>
            	  <h:param name="language"    value="{$language}"/>
            	  <h:param name="score"       value="{$score}"/>
            	</h:parameters>
            	return transform:transform($doc,$xsl,$params)
                  }
                  </h:div>
                  {layout:page-footer($mode)}
                </h:div>
              </h:body>
            </h:html>

return $result
