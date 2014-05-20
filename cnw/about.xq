xquery version "1.0" encoding "UTF-8";

import module namespace layout="http://kb.dk/this/app/layout" at "./cnw-layout.xqm";
declare option exist:serialize "method=xml media-type=text/html;charset=UTF-8";
declare variable $mode   := request:get-parameter("mode","about") cast as xs:string;

<html xmlns="http://www.w3.org/1999/xhtml">
  {layout:head("About Carl Nielsen Works Catalogue (CNW)",())}
  <body class="text">
    <div id="all">
      {layout:page-head("CNW","Carl Nielsen Works Catalogue")}
      {layout:page-menu($mode)}
      <div id="main">
      <h1>About the Carl Nielsen Works Catalogue (CNW)</h1>
	<p>
	 <span class="label">Edited by: </span>Niels Bo Foltmann, Axel Teich Geertinger, Peter Hauge, Niels Krabbe, Bjarke Moe and Elly Bruunshuus Petersen.
	</p>
	<p><span class="label">Published by: </span>Danish Centre for Music Publication<br/>
	The Royal Library<br/>
	P.O. Box 2149<br/>
	DK-1016 Copenhagen K<br/>
	Denmark<br/>
	WWW: <a href="http://www.kb.dk/dcm">www.kb.dk/dcm</a><br/>
	E-mail: <a href="mailto://foa-dcm@kb.dk">foa-dcm@kb.dk</a></p> 
	<p><span class="label">&#160;</span>2014</p>
	<p><span class="label">Sponsor: </span>Carl Nielsen and Anne Marie Carl-Nielsen's Legat</p>
      </div>
      {layout:page-footer($mode)}
    </div>
  </body>
</html>

