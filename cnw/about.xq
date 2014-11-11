xquery version "1.0" encoding "UTF-8";

import module namespace layout="http://kb.dk/this/app/layout" at "./cnw-layout.xqm";
declare option exist:serialize "method=xml media-type=text/html;charset=UTF-8";
declare variable $mode   := request:get-parameter("mode","about") cast as xs:string;

<html xmlns="http://www.w3.org/1999/xhtml">
  {layout:head("About the Catalogue of Carl Nielsen&apos;s Works (CNW)",())}
  <body class="text">
    <div id="all">
      {layout:page-head("CNW","Catalogue of Carl Nielsen&apos;s Works")}
      {layout:page-menu($mode)}
      <div id="main">
      <h1>Catalogue of Carl Nielsen&apos;s Works (CNW)</h1>
      <div id="colophon">
	<p>
	 <span class="label">Edited by: </span><span>Niels Bo Foltmann, Axel Teich Geertinger, Peter Hauge, Niels Krabbe, Bjarke Moe, Elly Bruunshuus Petersen</span>
	</p>
	<p><span class="label">Published by: </span><span>Danish Centre for Music Publication<br/>
	The Royal Library<br/>
	P.O. Box 2149<br/>
	DK-1016 Copenhagen K<br/>
	Denmark<br/>
	WWW: <a href="http://www.kb.dk/dcm">www.kb.dk/dcm</a><br/>
	E-mail: <a href="mailto://foa-dcm@kb.dk">foa-dcm@kb.dk</a></span></p> 
	<p><span class="label">&#160;</span><span>&#169; 2014</span></p>
	<p><span class="label">Translation of song texts' first lines:</span><span><br/>Holger Scheibel</span></p>
	<p><span class="label">Technical development:</span><span>Sigfrid Lundberg, Axel Teich Geertinger</span></p>
	<p><span class="label">Assistants:</span><span>Katarina Smitt Engberg, Niclas Nørby Hundahl</span></p>
	<p><span class="label">Created with:</span><span><a href="http://www.kb.dk/en/nb/dcm/projekter/mermeid.html"
	title="See MerMEId project page">MerMEId</a></span></p>
	<p><span class="label">Sponsor: </span><span>Carl Nielsen og Anne Marie Carl-Nielsens Legat</span></p>
	</div>
      </div>
      {layout:page-footer($mode)}
    </div>
  </body>
</html>

