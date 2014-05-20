xquery version "1.0" encoding "UTF-8";

import module namespace layout="http://kb.dk/this/app/layout" at "./cnw-layout.xqm";
declare option exist:serialize "method=xml media-type=text/html;charset=UTF-8";
declare variable $mode   := request:get-parameter("mode","preface") cast as xs:string;

<html xmlns="http://www.w3.org/1999/xhtml">
  {layout:head("Preface: Carl Nielsen Works Catalogue (CNW)",())}
  <body class="text">
    <div id="all">
      {layout:page-head("CNW","Carl Nielsen Works Catalogue")}
      {layout:page-menu($mode)}
      <div id="main">
      <h1>Preface</h1>
<p>The Carl Nielsen Works
Catalogue
(CNW) is the first ever thematic-bibliographic registration of all
Nielsen’s
works. A few projects regarding a catalogue have previously been
prepared of
which Fog and Schousboe’s bibliography (1965) was the first.<a
 href="#_ftn1" name="_ftnref1" title=""><!--[if !supportFootnotes]-->[1]<!--[endif]--></a> The Bjørnum and
Møllerhøj
catalogue from 1992 on Nielsen’s manuscripts in The Royal Library is
one of the
most important groundworks though it strictly speaking is not a work
catalogue.<a href="#_ftn2"
 name="_ftnref2" title=""><!--[if !supportFootnotes]-->[2]<!--[endif]--></a>
 </p> 
 <p>The first
complete survey of
all Nielsen’s musical works and their sources was not initiated,
however, until
the foundation of the <i>Carl Nielsen
Edition</i> (CNU; 1997–2009). In more than one sense CNW is a
natural extension
of CNU and builds on to a large extent the information accumulated in
connection with the editing project. The Danish Centre for Music
Publication
which is responsible for the publication of CNW was established at The
Royal
Library shortly after the termination of the Carl Nielsen Edition, in
particular in order to maintain and carry on the music philological
expertise
and not least exploit the detailed knowledge of Nielsen’s works that
had been gathered
during the working on the complete edition. 
</p>
<p>Biographical as well as
bibliographic information has also been drawn from a number of other
works,
among others <i>The Carl Nielsen Letters</i>,<a
 href="#_ftn3" name="_ftnref3" title=""><!--[if !supportFootnotes]-->[3]<!--[endif]--></a> the publication
of Nielsen’s
other written works,<a
 href="#_ftn4" name="_ftnref4" title=""><!--[if !supportFootnotes]-->[4]<!--[endif]--></a> and the current bibliography
available
in the journal <i>Carl Nielsen Studies</i>,
all affiliated with The Royal Library. </p>
<p>We wish to express our
sincerest
thanks to the Carl Nielsen and Anne Marie Carl-Nielsens Foundation for
supporting the project financially. Thanks are also due to Knud Ketting
who
most kindly has provided us with information on the first known
performances of
the musical works.</p>
<div><!--[if !supportFootnotes]--><br clear="all"/>
<hr/>
<!--[endif]-->
<div id="ftn1">
<p><a
 href="#_ftnref1" name="_ftn1" title=""><!--[if !supportFootnotes]-->[1]<!--[endif]--></a> Dan
Fog &amp; Torben Schousboe, <em>Carl Nielsen.
Kompositioner.
En Bibliografi</em> (Copenhagen, 1965).</p>
</div>
<div id="ftn2">
<p><a
 href="#_ftnref2" name="_ftn2" title=""><!--[if !supportFootnotes]-->[2]<!--[endif]-->
 </a> Birgit Bjørnum &amp; Klaus Møllerhøj, <em>Carl Nielsens
Samling. Katalog over
komponistens musikhåndskrifter i Det kongelige Bibliotek</em>
(Copenhagen, 1992).</p>
</div>
<div id="ftn3">
<p><a
 href="#_ftnref3" name="_ftn3" title=""><!--[if !supportFootnotes]-->[3]<!--[endif]--></a> John Fellow (ed.), <i>Carl
Nielsen Brevudgaven</i> (Copenhagen, 2005–).</p>
</div>
<div id="ftn4">
<p><a
 href="#_ftnref4" name="_ftn4" title=""><!--[if !supportFootnotes]-->[4]<!--[endif]--></a> John Fellow (ed.), <i>Carl
Nielsen til sin samtid</i> (Copenhagen, 1999).</p>
</div>
</div>
      </div>
      {layout:page-footer($mode)}
    </div>
  </body>
</html>

