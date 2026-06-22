xquery version "1.0" encoding "UTF-8";
declare namespace h="http://www.w3.org/1999/xhtml";

import module namespace layout="http://kb.dk/this/app/layout" at "./layout.xqm";

declare option exist:serialize "method=xhtml5 media-type=text/html doctype-public=html";

declare variable $mode := request:get-parameter("mode","acknowledgements") cast as xs:string;

declare variable $coll := request:get-parameter("c","") cast as xs:string;

declare variable $html := doc(concat("/db/cat-site/",$coll,"/acknowledgements.html"));

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
  {layout:head(concat("Acknowledgements: ",$html//h:title/text()),
  (<link rel="stylesheet" type="text/css" href="style/mei_to_html_public.css"/>),
  false())}
  <body class="text">
    <div id="all">
      {layout:page-head-doc($html)}
      {layout:page-menu($mode)}
      {
         for $main in $html//h:div[@id="main"]
         return $main
      }
    {layout:page-footer($mode)}
    </div>
  </body>
</html>

