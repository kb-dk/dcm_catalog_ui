xquery version "1.0" encoding "UTF-8";

import module namespace layout="http://kb.dk/this/app/layout" at "./cnw-layout.xqm";
declare option exist:serialize "method=xml media-type=text/html;charset=UTF-8";
declare variable $mode   := request:get-parameter("mode","introduction") cast as xs:string;

<html xmlns="http://www.w3.org/1999/xhtml">
  {layout:head("Introduction: Carl Nielsen Works Catalogue (CNW)",(<link rel="stylesheet" type="text/css" href="/editor/style/mei_to_html_public.css"/>))}
  <body class="text">
    <div id="all">
      {layout:page-head("CNW","Carl Nielsen Works Catalogue")}
      {layout:page-menu($mode)}
      <div id="main">
      <h1>Introduction</h1>
      
      <h2>Table of contents</h2>
      <ul id="toc">
        <li><a href="#methodology">Methodology and work status</a></li>
        <ul>
          <li><a href="#definition">Definition of 'Work'</a></li>
          <li><a href="#excerpts">Works and excerpts</a></li>
          <li><a href="#sources">Sources</a></li>
          <li><a href="#songs">Songs originating from plays</a></li>
          <li><a href="#collections">Song collections</a></li>
          <li><a href="#arrangements">Arrangements and re-instrumentations</a></li>
          <li><a href="#order">Order of numbering</a></li>
        </ul>
        <li><a href="#howto">How to use the catalogue</a></li>
        <ul>
          <li><a href="#searching">Delimitation and searching</a></li>
          <li><a href="#sorting">Display and sorting of search results</a></li>
        </ul>
        <li><a href="#contents">The structure and contents of each record</a></li>
        <ul>
          <li><a href="#titles">Work titles</a></li>
          <li><a href="#identification">Identification</a></li>
          <li><a href="#history">The work's history</a></li>
          <li><a href="#music">Instrumentation and sequence of movements</a></li>
          <li><a href="#sources">Sources</a></li>
          <li><a href="#bibliography">Bibliography</a></li>
        </ul>
      </ul>
      
      
<h2><a name="methodology">Methodology and work status</a></h2>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="definition">Definition of 'Work'</a></h3>
<p>The disposition of a catalogue of works presents a series of fundamental problems related to the Work
concept. The catalogue must necessarily operate with an either­–or: a
composition may be seen as either an independent work – hence assigned a CNW
number – or may fall outside the chosen delimitation and therefore does not appear
with its own number. </p>
<p>In essence CNW includes
compositions which are complete in structure though not necessarily so in detail.
Thus fragments of compositions, which as far as is known were never
finished, are not listed. </p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="excerpts">Works and excerpts</a></h3>
<p>Those instances, where excerpts of works – either in
original form or as arrangements – have had a separate and significant reception
history independent of their original context, are more difficult to solve.
This applies to a number of songs which originally were composed in relation
to stage music but were disseminated and became known as independent
works. In addition, CNW distinguishes between instrumental and vocal music:
instrumental excerpts of larger works are essentially not interpreted as independent
works. Thus the <i>&apos;Aladdin&apos; Suite</i>, for instance, is placed under <i>Musik til Adam Oehlenschlägers skuespil 
&apos;Aladdin eller Den forunderlige Lampe&apos;</i> (Music for Adam
Oehlenschlägers Play &apos;Aladdin or the Wonderful Lamp&apos;) <a class="work_number_reference" href="document.xq?doc=cnw0017.xml">CNW 17</a>.
Similarly, <i>Taagen letter</i> (The Fog is Lifting) is only to be found in relation to <i>Music til Helge Rodes
skuespil &apos;Moderen&apos;</i> (Music for Helge Rode&apos;s
Play &apos;The Mother&apos;) <a class="work_number_reference" href="document.xq?doc=cnw0018.xml">CNW 18</a>, in spite of the fact that <i
>Taagen letter</i>, in various arrangements, is far better known as
an independent piece than the stage music for the play as a whole. The
delimitation has been chosen since excerpts and arrangements constitute
a continuum in which it is difficult to draw a clear line: from a complex
version of the work or the grouping of a series of movements (e.g. the <i
>&apos;Aladdin&apos; Suite</i>), over single movements
which sometimes are performed independently – e.g. <i>Hanedansen</i> (The
Cockerel&apos;s Dance) from <i>Maskarade</i> (Masquerade) <a class="work_number_reference" href="document.xq?doc=cnw2.xml">CNW 2</a> – 
and to actual arrangements of such movements (e.g. <i>Taagen letter</i>).</p>

<h3><a name="sources">Sources</a></h3>
<p><span class="new">CNW lists sources created during Carl Nielsen&apos; lifetime. Only sources directly related 
to Nielsen as well as sources representing his own versions of his works are listed. 
Other composers&apos; arrangements of Nielsen&apos;s works thus are not included.
</span></p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="songs">Songs originating from plays</a></h3>
<p>Regarding songs that have their origin in larger contexts, another approach has been chosen. Such songs
are also listed in the catalogue as separate works – that is, if they in addition were
published outside their original context, either separately or as part
of a collection of songs. One good example worth mentioning is <i
>Som en rejselysten Flaade</i> (There&apos;s a Fleet of Floating Islands) <a class="work_number_reference" href="document.xq?doc=cnw0237.xml">CNW 237</a>
that originally was composed for the play, <i>Moderen</i> (The Mother) 
<a class="work_number_reference" href="document.xq?doc=cnw0018.xml">CNW 18</a>, 
but which furthermore was published as part of an excerpt of the
play in piano score and as a four-part arrangement for mixed choir. Such songs
have been assigned with their own CNW number, even
though they also appear as part of another work. </p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="collections">Song collections</a></h3>
<p>The same applies to those
songs which were published in collections, regardless of whether they were
publications including songs by various composers or collections only including
songs by Nielsen, and regardless of whether the songs were also published
separately. These collections make up a continuum ranging from existing separate
songs, chosen for publication in a broader context (e.g. <i
>Folkehøjskolens Melodibog</i>), to
collections that were composed during a coherent period of time and of
a more cyclic nature, e.g. <i>Seks sange til tekster af Ludvig Holstein</i> (Six Songs to Texts
by Ludvig Holstein), Op. 10. The songs have been
listed as separate works (including, of course, the information on the
collection/s of which they were part) because 1) it is difficult to draw a clear line
between grouped, separate songs and actual cycles of songs; and 2) the songs are sometimes 
also found in other contexts. These work criteria imply that a song
such as Jeronimus&apos; song (&apos;Fordum var her Fred paa Gaden&apos;) from <i>Maskarade</i> (Masquerade)
<a class="work_number_reference" href="document.xq?doc=cnw0002.xml">CNW 2</a>, is <em>not</em> to be found in CNW as
an individual work since it, in spite of its popularity in Nielsen&apos;s
lifetime, was never published separately. In other words, it is the source situation
that determines the evaluation of a song&apos;s status as a work and not its
reception history.</p>
<p>Though the song collections do
not occur as works assigned one individual CNW number, they are
described separately. The description of a song collection is contained
in one single record which also includes a listing of the collection&apos;s contents (that is, those songs
which the collection contains) as well as the sources related that particular
collection. Thus the sources of the collections are not listed under
each song but are found under the collection or collections in which the song
appeared. The collection is located by clicking its title
appearing under the &apos;Contained in:&apos; heading. The description of a single
song of a collection, however, is found by proceeding to the song&apos;s title in the index of
of the collection (under the heading &apos;Contains:&apos;).</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="arrangements">Arrangements and re-instrumentations</a></h3> 
<p>Different arrangements of the same
composition are not defined as independent works but are included under
the same CNW number, also when it comes to songs. This overall
understanding of &apos;work&apos; therefore implies that there is not a one-to-one agreement between a
work in CNW and an edition in CNU in all instances, but that there may be
several CNU editions under the same CNW number. This applies to <i>Hjemvee</i> 
(Homesickness; better known with the first line &apos;Underlige Aftenlufte&apos;) <a class="work_number_reference" href="document.xq?doc=cnw0205.xml">CNW 205</a>, for
instance, which has been published in CNU in four distinct arrangements of the
same melody, all listed under the same number in CNW.</p>
<p>Nielsen&apos;s second and lesser known melody to the same text has, on the other hand, its
own number (<a class="work_number_reference" href="document.xq?doc=cnw0296.xml">CNW 296</a>).
<span class="new">Also songs employing the same melody but having different text are regarded as distinct compositions, 
for instance <i>Julesang</i> (Christmas Carol; 1923) <a class="work_number_reference" href="document.xq?doc=cnw0313.xml">CNW 313</a>, 
which Nielsen re-used with a another text  in 1924 ('Dannevang med grønne bred') 
<a class="work_number_reference" href="document.xq?doc=cnw0318.xml">CNW 318</a>.</span>
</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="order">Order of numbering</a></h3>
<p>Often Nielsen&apos;s works cannot be dated precisely. They were composed over longer periods, and at a later
date they were sometimes revised to such an extent that it hardly makes
sense to assign them to one particular time in Nielsen&apos;s production. The
catalogue numbers are therefore arranged according to genre 
though a certain chronology has been sought within each genre. </p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h2><a name="howto">How to use the catalogue</a></h2>
<p>The catalogue&apos;s primary entry to the records is the list of work titles. 
In a column to the left of the titles it
is possible to modify and limit the search results while at the top of the
list there are different settings as to how the results may be displayed.</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="searching">Delimitation and searching</a></h3>
<p>On the menu at the left side of the display,
the following possibilities to change or limit the search are listed:</p>
<ul>
<li>Keywords:
free text search (may for example be used for searching title keywords,
for a particular CNW number or records mentioning a particular person). The
search is not case sensitive and search words may be truncated with an asterisk (*).</li>
<li>Year of composition: 
the search may be limited to works that are composed in
a particular period, which is obtained by adjusting the
slides and then by clicking the &apos;Search&apos; button. Please note that searching by year
only includes that year which marks the end of the period. A work listed as having
been composed between 1880 and 1883 will thus be found by searching for
works from the period 1882–85, for instance, but not 1880–82. Note also that
when searching for year of composition, undated works will not turn up.</li>
<li>Genre:
by clicking on a genre designation the search is limited to those works
that are listed under that particular genre as the work&apos;s primary genre.
Several works may have the genre added as a secondary designation. These records are
found by searching the genre in the free text search field instead. </li>
<li>Anthologies:
as a standard the list of search results does not include anthologies
(song collections) as they are not recorded as works with a CNW number (see
work definition above). In order to include such collections in the search,
the checkbox &apos;Include anthologies&apos; must be ticked off.</li>
</ul>
<p>All search limitations function
additively, that is, a simultaneous use of several search parameters confines the
result further (logically &apos;AND&apos;). Each delimiting parameter (filter) is shown
at the top of the list of search results when the search has been completed. Each filter may be removed
one at a time by clicking on the [delete] symbol at the filter in question, thus
expanding the search again. Filters may be removed all at once by clicking on the red 
&apos;Reset all&apos; button in the list of filters. </p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="sorting">Display and sorting of search results</a></h3>
<p><span class="new">
The search result is displayed as a list of work titles. By default, only 20 search results are displayed 
at a time. Navigate through the result pages using the numbered navigation buttons above the result list. 
The number of results per page can be changed by selecting a different number in the select box above the navigation buttons.</span></p>
<p><span class="new">
The sort order of the results can be changed with the other select box next to the works-per-page selector. 
Possible sort orders are CNW number (default), alphabetically by title, and chronologically by year of composition. 
The chronological sorting, however, is only a rough approximation. I takes into account only the year in which the composition 
was completed. Works undated are listed first.</span></p>
<p><span class="new">
Clicking a work&apos;s main title opens the detailed view.</span></p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h2><a name="contents">The structure and contents of each record</a></h2>
<p>A certain amount of information is displayed directly on each record. For the sake of clarity, 
other data may be hidden under the tabs &apos;Music&apos;, &apos;Performances&apos;, &apos;Sources&apos;,
&apos;Primary texts&apos;  and &apos;Bibliography&apos; with a plus sign (+). By clicking the sign
the hidden information will fold out and may be closed again. </p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="titles">Work titles</a></h3>
<p>Precise titles are kept thus reproducing
Nielsen&apos;s original orthography. They reveal changes in Nielsen&apos;s
spelling and punctuation habits throughout his life and are apparent in titles such
as <i>Har Haand du lagt paa Herrens Plov</i>
<a class="work_number_reference" href="document.xq?doc=cnw0173.xml">CNW 173</a>
and <i>Jeg gik i marken og vogtede får</i>
<a class="work_number_reference" href="document.xq?doc=cnw0327.xml">CNW 327</a>. 
From an orthographical point of view the titles in general expose a
heterogeneous and a seemingly inconsistent practice which, however, has
been retained rather than modernised, partly because it would be just as dated
(though to a later time) and partly because modernisation is also a question
of degree which in the extreme would not only include
spelling and punctuation but also the choice of words.</p>
<p>Several of Nielsen&apos;s songs were published in various contexts with distinct orthography: 
<i>Melodier til Sangbogen Danmark</i> (1924), for
example, employs the older orthography while <i>Folkehøjskolens
Melodibog</i> (1922) uses the modern. In these instances CNW reproduces
the orthography of the earliest published title. In the description of the
contents of the song collections the titles are rendered as in the collection
concerned.</p>
<p>Titles that are similar to genre designations have – as have instrument designations –
been standardised and modernised such as <i>Kvartet
for to violiner, bratsch og cello</i> <a class="work_number_reference" href="document.xq?doc=cnw49.xml">CNW 49</a>.</p>
<p>Many of the songs Nielsen never gave
an actual title; in these cases the first line of the text has been
added as title in quotation marks. In the remaining instances the text
incipit is given as the alternative title, also when the song is better known by
its first line (e.g. <i>Hjemvee</i> <a class="work_number_reference" href="document.xq?doc=cnw205.xml">CNW 205</a>), better
known as &apos;Underlige Aftenlufte!&apos;).</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="identification">Identification</a></h3>
<p>In addition to the actual CNW
number, the catalogue provides each work&apos;s number in an array of other
contexts including Nielsen&apos;s own opus numbers, Fog/Schousboe numbers and the
work&apos;s manuscript shelf mark in the Carl Nielsen Collection (CNS) at The Royal Library. </p>
<p>Furthermore, <span class="new">each record lists the number of the work in the Nielsen Edition (CNU);</span> 
the numbers signify series and volume. The song numbers are preceded by a comma. If several versions occur in
the same CNU volume these are separated by yet a comma; versions in other volumes
are divided by a semicolon. Thus &apos;CNU III/5, 146, 229; III/6, 324&apos; refers
to numbers 146, 229 and 324 in the Nielsen Edition of which the two
first-mentioned are in Series III (songs) volume 5 whereas the latter
is in Series III volume 6.</p>
<p>Then the name of a possible text author follows. </p>
<p>Each song record includes a link
titled &apos;Carl Nielsen Edition (Editorial Texts)&apos; referring to a PDF-file
of the text volume to all the songs. Since the information regarding each song
(history, English translation, source descriptions and
list of revisions) is found in various sections of the volume, the link does
not refer to a particular page. Information on each song is
located by referring to the index at the end of the volume.</p>
<p>If the work is related to other
works or song collections this has been indicated by clickable titles
linking to information placed under their CNW numbers. </p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="history">The work&apos;s history</a></h3>
<p>In addition to the work&apos;s genesis,
the brief summary also includes information on the dating of the
composition of the work, the first known performance and sometimes also a few other
performances. Besides the date of the performance, also place,
participants and in some cases information regarding reviews are included.</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="music">Instrumentation and sequence of movements</a></h3>
<p>If a work occurs in different
instrumentations, this will normally be indicated under each version of
the work. The instrumentation is given using abbreviations (see list of
abbreviations). For an unambiguous identification of the works CNW
provides incipits including the first bars of the work&apos;s main parts
(movements, scenes or similar). Works of a more extensive instrumentation are
provided with incipits in short score. By clicking on an incipit, a larger edition
appears in a separate window.</p>
<p>In records of works of a more complex structure, such as operas divided into acts, scenes and
sections of scenes, the information constitutes a hierarchy of each individual
element that may be folded out by clicking on the &apos;Sections&apos; heading.</p>
<p>A link marked &apos;Carl Nielsen Edition&apos; leads to a PDF-file of that volume (or volumes) of the
Nielsen Edition which contains the work. Some works, which were originally
published in a composite volume, were also published as soft-bound
off-prints, for example the flute and clarinet concertos. In
these instances the link refers to the off-prints. </p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="sources">Sources</a></h3>
<p>The overview of sources for each work includes sources from Nielsen&apos;s lifetime only.</p>
<p>The source descriptions are minimal, providing the most basic information for identification. More
detailed descriptions are available in the volumes of the Nielsen Edition (CNU). To
facilitate the consultation CNW lists the CNU&apos;s source designation (e.g.
&apos;CNU Source <b>A</b>&apos;). The appropriate CNU volumes are available via the mentioned link.</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="bibliography">Bibliography</a></h3>
<p>At present, the bibliography deals with primary texts mainly consisting of letters to
and from Nielsen as well as Nielsen&apos;s diaries. The information is based on
the forthcoming <a class="abbr" href="javascript:void(0);"><i>Carl Nielsen Brevudgaven</i> (Carl Nielsen Letters)<span 
class="expan">John Fellow (ed.): <em>Carl Nielsen Brevudgaven</em>. Multivers, Copenhagen 2005-. </span></a>.
References do not include letters from Nielsen&apos;s latest years but they 
will be added as soon as possible when the complete edition is available. </p>
<p>In so far as it has been possible, references to letters dealing with actual songs have
been listed under the specific song rather than the collection or those collections
in which the song appeared. Letters mentioning a song collection or
unspecified songs from a collection are, however, listed under the collection. It
is the intention to expand the bibliography also comprising secondary literature such as 
scholarly literature on the works. Till then we refer the user to
consult the current bibliography on Nielsen literature which is published in the
journal <i>Carl Nielsen Studies</i>. The cumulative bibliography is available at &lt;<a
 href="http://www.kb.dk/en/nb/dcm/cnu/cn_bibliography.html">http://www.kb.dk/en/nb/dcm/cnu/cn_bibliography.html</a>&gt;.</p>
      </div>
      {layout:page-footer($mode)}
    </div>
  </body>
</html>

