xquery version "1.0" encoding "UTF-8";

import module namespace layout="http://kb.dk/this/app/layout" at "./cnw-layout.xqm";
declare option exist:serialize "method=xml media-type=text/html;charset=UTF-8";
declare variable $mode   := request:get-parameter("mode","about") cast as xs:string;

<html xmlns="http://www.w3.org/1999/xhtml">
  {layout:head("About Carl Nielsen Works (CNW)",())}
  <body class="list_files">
    <div id="all">
      {layout:page-head("CNW","A Thematic Catalogue of Carl Nielsen&apos;s Works")}
      {layout:page-menu($mode)}
      <div id="main">
	<p>
	...
	</p>
      </div>
      {layout:page-footer($mode)}
    </div>
  </body>
</html>

