xquery version "1.0" encoding "UTF-8";
declare namespace h="http://www.w3.org/1999/xhtml";

import module namespace layout="http://kb.dk/this/app/layout" at "./cnw-layout.xqm";
declare option exist:serialize "method=xml media-type=text/html;charset=UTF-8";
declare variable $mode   := request:get-parameter("mode","appendix") cast as xs:string;

let $html := doc("appendix.html")


let $contents :=
<html xmlns="http://www.w3.org/1999/xhtml">
  
  {layout:head("Appendix: Catalogue of Carl Nielsen&apos;s Works (CNW)",(<link rel="stylesheet" type="text/css" href="/editor/style/mei_to_html_public.css"/>))}
  <body class="text">
    <div id="all">
      {layout:page-head("CNW","Catalogue of Carl Nielsen&apos;s Works")}
      {layout:page-menu($mode)}
      {
         for $main in $html//h:div[@id="main"]
         return $main
      }
    {layout:page-footer($mode)}
    </div>
  </body>
</html>

return $contents

