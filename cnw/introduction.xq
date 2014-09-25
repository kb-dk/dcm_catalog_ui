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
        <li><a href="#source_situation">Sources to Nielsen&apos;s music</a></li>
        <li><a href="#methodology">Methodology and work concept</a></li>
        <ul>
          <li><a href="#definition">Definition of &apos;Work&apos;</a></li>
          <li><a href="#excerpts">Works and excerpts</a></li>
          <li><a href="#songs">Songs originating from plays</a></li>
          <li><a href="#collections">Song collections</a></li>
          <li><a href="#arrangements">Arrangements and re-instrumentations</a></li>
          <li><a href="#order">Order of numbering</a></li>
        </ul>
        <li><a href="#howto">How to use the catalogue</a></li>
        <ul>
          <li><a href="#searching">Filtering and searching</a></li>
          <li><a href="#sorting">Display and sorting of search results</a></li>
        </ul>
        <li><a href="#contents">The structure and contents of each record</a></li>
        <ul>
          <li><a href="#titles">Work titles</a></li>
          <li><a href="#identification">Identification</a></li>
          <li><a href="#history">The work&apos;s history</a></li>
          <li><a href="#music">Instrumentation and movements</a></li>
          <li><a href="#sources">Sources</a></li>
          <li><a href="#bibliography">Bibliography</a></li>
        </ul>
      </ul>
      
<h2><a name="source_situation">Sources to Nielsen&apos;s music</a></h2>      
<p>The Royal Library in Copenhagen holds the majority of the surviving sources to Nielsen’s music, 
presumably amounting to more than ninety-five percent of all the material. 
The remaining five percent are found in other Danish and foreign libraries among which Musikbiblioteket 
(Stockholm) and Leipzig Stadtarchiv should be mentioned. Apparently only very few manuscripts are still privately owned. </p>
      <p>Rough drafts as well as ink fair copies to most of Nielsen&apos;s larger musical works have survived. 
      In some instances, the ink fair copy has entirely or partly been produced by a foreign hand 
      (Knud Jeppesen, Nancy Dalberg, Emil Telmányi or others), authorized by the composer. 
      Also foreign corrections carried out in the manuscripts are in most cases sanctioned and approved by Nielsen.</p>

<p>Already in 1935, that is four years after the composer&apos;s death and on occasion of his seventieth anniversary, 
a number of prominent individuals led by the composer, musicologist and pupil of Nielsen&apos;s, Knud Jeppesen, 
started gathering Nielsen&apos;s surviving manuscripts. In a call for material sent to Nielsen&apos;s acquaintances and pupils, 
they asked for information on manuscripts or other sources which the respondents might have in their possession 
and encouraged them to hand over the material to the newly established Carl Nielsen Archive in The Royal Library 
(the enquiry and the replies are kept in The Royal Library, Håndskriftafdelingen, Journalsager nr. 4802). </p>
<p>The appeal made it possible for the library to establish the Carl Nielsen archives, in the first instance 
with donations from Hakon Andersen, Harald Balslev, Emilius Bangert, Anders Brems, Knud Jeppesen, Alfred Nielsen, 
Aage Oxenvad, Margrethe Rosenberg and Margrethe Schnor. 
However, in 1935, the majority of Nielsen&apos;s manuscripts were still in the family&apos;s possession, 
in particular his widow, Anne Marie Carl-Nielsen. After her death in 1945, 
Nielsen’s oldest daughter, Irmelin Eggert Møller, inherited the collection. 
Other manuscripts were in the hands of Nielsen’s son-in-law, the violinist Emil Telmányi 
who was married to Nielsen&apos;s second daughter Anne Marie. </p>
<p>Substantial parts of the collection, which since then has become the basis
of the Carl Nielsen archives, were handed over to the library in 1958 
by Irmelin Eggert Møller. 
Later a series of individual donations were presented by Nielsen’s acquaintances and associates 
of which the last large donation was received in 1991. 
It is most likely that only very few autograph manuscripts remain unknown.</p>
<p>The Royal Library has organized the material in two distinct collections: 
<i>Carl Nielsen Arkivet</i> (the Carl Nielsen Archive, CNA) containing letters and 
other textual sources, and <i>Carl Nielsens Samling</i> (Carl Nielsen’s Collection, CNS) 
containing musical sources, both manuscripts and prints.</p>
      
<h2><a name="methodology">Methodology and work concept</a></h2>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="definition">Definition of &apos;Work&apos;</a></h3>
<p>The disposition of a catalogue of works presents a series of fundamental problems related to the work
concept. The catalogue must inevitably operate with an either–or: a
composition may be seen as either an independent work – hence assigned a CNW
number – or may fall outside the chosen delimitation and therefore does not appear
with its own unique number. </p>
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
instrumental excerpts of larger works are basically not interpreted as independent
works. Thus the <i>&apos;Aladdin&apos; Suite</i>, for instance, is placed under the music 
for the play, <i>Musik til Adam Oehlenschlägers skuespil 
&apos;Aladdin eller Den forunderlige Lampe&apos;</i> <a class="work_number_reference" 
title="View work details" href="document.xq?doc=cnw0017.xml">CNW 17</a>.
Similarly, <i>Taagen letter</i> (The Fog is Lifting) is only to be found in relation to <i>Musik til Helge Rodes
skuespil &apos;Moderen&apos;</i> <a class="work_number_reference" href="document.xq?doc=cnw0018.xml"
title="View work details" >CNW 18</a>, in spite of the fact that <i
>Taagen letter</i>, in various arrangements, is far better known as
an independent piece than the stage music for the play as a whole.</p>
<p>Nielsen&apos;s orchestral piece, <i>Saga-drøm</i> <a 
class="work_number_reference" href="document.xq?doc=cnw0035.xml"
title="View work details" >CNW 35</a>, is on the other hand listed as a separate work,
even though it was also used as part of the music for the play, <i>Moderen</i>.
This is due to the fact that Nielsen conceived <i>Saga-drøm</i> as a work of its own
several years before he decided to include it in <i>Moderen</i>.
</p>

<p>This general approach was chosen because it is difficult 
to draw a clear line between works and versions otherwise: 
excerpts and arrangements constitute a continuum ranging 
from re-instrumentations of
the work or the grouping of selected movements (e.g. the <i
>&apos;Aladdin&apos; Suite</i>), over single movements
which sometimes are performed independently (e.g. <i>Hanedansen</i> 
from <i>Maskarade</i> <a class="work_number_reference" 
title="View work details" href="document.xq?doc=cnw2.xml">CNW 2</a>) 
and to actual arrangements of such individual movements (e.g. <i>Taagen letter</i>).</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="songs">Songs originating from plays</a></h3>
<p>Regarding songs that have their origin in larger contexts, another approach has been chosen. Such songs
are also listed in the catalogue as individual works – that is, if they were also 
published outside their original context, either separately or as part
of a collection of songs. One good example worth mentioning is <i
>Sangen til Danmark</i> <a class="work_number_reference" 
title="View work details" href="document.xq?doc=cnw0237.xml">CNW 237</a> that 
was originally composed for the play, <i>Moderen</i> <a 
class="work_number_reference" href="document.xq?doc=cnw0018.xml"title="View work details" >CNW 18</a>, 
but which furthermore was published as part of an excerpt of the
play in piano score and as a four-part arrangement for mixed choir. 
These songs have been assigned with their own CNW number, 
though they also appear as part of another work. </p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="collections">Song collections</a></h3>
<p>The same applies to those
songs which were published in collections, regardless of whether they were
publications including songs by various composers or collections only including
songs by Nielsen, and regardless of whether the songs were also published
separately. These collections make up a continuum ranging from existing individual
songs, chosen for publication in a broader context (e.g. <i
>Folkehøjskolens Melodibog</i>), to
collections that were composed during a coherent period of time and of
a more cyclic nature, such as <i>Seks sange til tekster af Ludvig Holstein</i>, Op. 10. 
The songs have been
listed as individual works (including, of course, the information on the
collection/s of which it was part) because 1) it is difficult to draw a clear line
between grouped, separate songs and actual cycles of songs; and 2) the songs are sometimes 
also found in other contexts. These work criteria imply that a song
such as Jeronimus&apos; song (&apos;Fordum var her Fred paa Gaden&apos;) from <i>Maskarade</i> <a 
class="work_number_reference" href="document.xq?doc=cnw0002.xml"title="View work details" >CNW 2</a>, 
is <em>not</em> listed in CNW as
an individual work since it, in spite of its popularity in Nielsen&apos;s
lifetime, was never published by itself. In other words, it is the source situation
that determines the evaluation of a song&apos;s status as a work rather than its
reception history.</p>
<p>Though the song collections have not been assigned one unique CNW number, they are
described individually. The description of a song collection is contained
in one record which also includes a listing of the collection&apos;s contents (i.e., those songs
which the collection contains) as well as the sources related to that particular
collection. Thus the sources of the collections are not listed under
each song but are found under the collection or collections in which the song
appeared. The collection is located by clicking on its title
appearing under the &apos;Contained in:&apos; heading. The description of a single
song of a collection, however, is found by proceeding to the song&apos;s title in the index 
of the collection (under the heading &apos;Contains:&apos;).</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="arrangements">Arrangements and re-instrumentations</a></h3> 
<p>Different arrangements of the same
composition are not defined as independent works but are included under
the same CNW number, also when it comes to songs. This overall
understanding of &apos;work&apos; implies therefore that there is not a one-to-one agreement between a
work in CNW and an edition in <a href="http://www.kb.dk/en/nb/dcm/cnu/" target="_blank"
title="The Carl Nielsen Edition">The Carl Nielsen Edition (CNU)</a> in all instances; CNU may have
several editions under the same CNW number. This applies to <i>Hjemvee</i> <a 
class="work_number_reference" href="document.xq?doc=cnw0205.xml">CNW 205</a>, for
instance (better known with the first line &apos;Underlige Aftenlufte&apos;), 
which is published in CNU in four distinct arrangements of the
same melody, all listed under the same entry in CNW. Nielsen&apos;s original and lesser known melody 
to the same text has, on the other hand, its
own entry (<a class="work_number_reference" href="document.xq?doc=cnw0296.xml" title="View work details">CNW 296</a>).</p>
<p>Also songs employing the same melody but with a different text are regarded as distinct compositions: 
for instance <i>Julesang</i> (1923) <a class="work_number_reference" 
title="View work details" href="document.xq?doc=cnw0313.xml">CNW 313</a>, 
which Nielsen re-used with another text in 1924 (&apos;Danevang med grønne bred&apos;) 
<a class="work_number_reference" href="document.xq?doc=cnw0318.xml" title="View work details">CNW 318</a>.
</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="order">Order of numbering</a></h3>
<p>Often Nielsen&apos;s works cannot be dated precisely. They were composed over longer periods, and at a later
date they were sometimes revised to such an extent that it hardly makes
sense to assign them to one particular time in Nielsen&apos;s production. The
CNW numbers are therefore arranged according to genre 
though a certain chronology has been sought within each genre. </p>
<p>As to the songs, CNW retains the overall arrangement of the Nielsen Edition. 
The songs are organized as follows according to the songs&apos; original scoring and context:
<br/>&#160;</p> 
<table cellpadding="0" cellspacing="0">
<tr><td style="padding-top: 8px;">Songs with piano </td><td style="padding-top: 8px;">Songs published in collections<br/>Separate songs</td></tr>
<tr><td style="padding-top: 8px;">Recitation and piano</td><td>&#160;</td></tr>
<tr><td style="padding-top: 8px;">Choir and piano</td><td>&#160;</td></tr>
<tr><td style="padding-top: 8px;">Voice and instrumental ensemble</td><td>&#160;</td></tr>
<tr><td style="padding-top: 8px;">A cappella choir</td><td>&#160;</td></tr>
<tr><td style="padding-top: 8px;">Mixed choir</td><td style="padding-top: 8px;">Songs published in collections<br/>Separate songs</td></tr>
<tr><td style="padding-top: 8px;">Male choir</td><td>&#160;</td></tr>
<tr><td style="padding-top: 8px;">Equal voices</td><td style="padding-top: 8px;">Songs published in collections<br/>Separate songs</td></tr>
<tr><td style="padding-top: 8px;">Unison songs</td><td style="padding-top: 8px;">Songs published in collections<br/>Separate songs</td></tr>
</table>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h2><a name="howto">How to use the catalogue</a></h2>
<p>The catalogue&apos;s primary entry to the records is the list of work titles. 
In a column to the left of the titles, it
is possible to modify and limit the search results, while at the top of the
list there are different settings as to how the results may be displayed.</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="searching">Filtering and searching</a></h3>
<p>On the menu at the left side of the display,
the following possibilities to change or limit the search are listed:</p>
<ul>
<li>Keywords:
free text search (may for example be used for searching title keywords,
for a particular CNW number or for records mentioning a particular person). The
search is not case sensitive and search words may be truncated with an asterisk (*).</li>
<li>Year of composition: 
the search may be limited to works that are composed in
a particular period, which is obtained by adjusting the
slides and clicking the &apos;Search&apos; button. Please note that searching by year
only includes that year which marks the end of the period. A work listed as having
been composed between 1880 and 1883 will thus be found only by searching for
works from a period including the year 1883. Note also that
when searching for year of composition, undated works will not turn up.</li>
<li>Genre:
by clicking on a genre designation, the search is limited to those works
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
one at a time by clicking on the delete symbol <span 
style="background-color: #515151; border-radius: 4px; display: inline-table;"><img 
style="vertical-align:middle" src="/editor/images/filter_remove.png" 
alt="&apos;delete&apos; symbol"/></span>
at the filter in question, thus
expanding the search again. Filters may be removed all at once by clicking on the red 
&apos;Reset all&apos; button in the list of filters. </p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="sorting">Display and sorting of search results</a></h3>
<p>The search result is displayed as a list of work titles. By default, only twenty search results are shown 
at a time. They reader may navigate through the result pages using the 
numbered navigation buttons above the result list. 
The number of results per page can be changed by selecting a different number in the 
select box above the navigation buttons.</p>
<p>The sort order of the results can be changed with the other select box next to the works-per-page selector. 
Possible sort orders are CNW number (default), alphabetically by title, and chronologically by year of composition. 
The chronological sorting, however, is only a rough approximation. 
It takes into account only the year in which the composition 
was completed. Undated works are listed first. 
Clicking on a work&apos;s title opens the detailed view.</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h2><a name="contents">The structure and contents of each record</a></h2>
<p>A certain amount of information is displayed directly on each record. For the sake of clarity, 
other data may be hidden under the tabs with a plus sign <img 
src="/editor/images/plus.png" alt="plus sign"/>, that is &apos;Music&apos;,  
&apos;Performances&apos;, &apos;Sources&apos;,
&apos;Primary texts&apos; and &apos;Bibliography&apos;. By clicking on the sign
the hidden information will unfold and may be closed again. </p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="titles">Work titles</a></h3>
<p>Precise titles are kept thus reproducing
Nielsen&apos;s original orthography. They reveal changes in Nielsen&apos;s
spelling and punctuation habits throughout his life and are apparent in titles such
as <i>Har Haand du lagt paa Herrens Plov</i> <a 
class="work_number_reference" title="View work details" 
href="document.xq?doc=cnw0173.xml">CNW 173</a> and <i>Jeg gik i marken og vogtede får</i> <a 
class="work_number_reference" title="View work details" href="document.xq?doc=cnw0327.xml">CNW 327</a>. 
From an orthographical point of view, the titles in general expose a
heterogeneous and a seemingly inconsistent practice which, however, has
been retained rather than modernized, partly because it would be just as dated
(though to a later time) and partly because modernization is also a question
of degree which in the extreme would not only include
spelling and punctuation but also the choice of words.</p>
<p>Several of Nielsen&apos;s songs were published in various contexts with distinct orthographies: 
<i>Melodier til Sangbogen Danmark</i> (1924), for
example, employs the older orthography while <i>Folkehøjskolens
Melodibog</i> (1922) uses the modern. As a rule, CNW reproduces
the orthography of the earliest published title in these instances. 
In the description of the
contents of the song collections the titles are rendered as in the collection
concerned.</p>
<p>Titles that are similar to genre designations have – as have instrument designations –
been standardized and modernized such as <i>Kvartet
for to violiner, bratsch og cello</i> (Quartet for Two Violins, Viola and Cello) <a 
class="work_number_reference" title="View work details" 
href="document.xq?doc=cnw49.xml">CNW 49</a>.</p>
<p>Many of the songs were never provided with an actual title by Nielsen; 
in these cases the first line of the text has been
added as title in quotation marks. In the remaining instances the text
incipit is given as the alternative title, also when the song is better known by
its first line (e.g. <i>Hjemvee</i> <a class="work_number_reference" title="View work details" 
href="document.xq?doc=cnw205.xml">CNW 205</a>, better
known as &apos;Underlige Aftenlufte&apos;).</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="identification">Identification</a></h3>
<p>In addition to the actual CNW
number, the catalogue provides each work&apos;s number in an array of other
contexts including Nielsen&apos;s own opus numbers, <a class="abbr" 
href="javascript:void(0);">FS (Fog/Schousboe)<span class="expan">Dan Fog and Torben Schousboe: 
<i>Carl Nielsen. Kompositioner. En Bibliografi</i>. Copenhagen 1965</span></a> numbers and the
work&apos;s manuscript shelf-mark in the Carl Nielsen Collection (CNS) in The Royal Library. </p>
<p>Furthermore, each record lists the work&apos;s number in the Nielsen Edition (CNU). 
The numbers signify series and volume. The song numbers are preceded by a comma. If several versions occur in
the same CNU volume these are separated by yet a comma; versions in other volumes
are divided by a semicolon. Thus &apos;CNU III/5, 146, 229; III/6, 324&apos; refers
to numbers 146, 229, and 324 in the Nielsen Edition of which the two
first-mentioned are in Series III (songs) volume 5, whereas the latter
is in Series III volume 6.</p>
<p>Then follows the name of a possible text author. </p>
<p>Each song record includes a link
titled &apos;Carl Nielsen Edition (Editorial Texts)&apos; referring to a PDF file
of the text volume to all the songs. Since the information regarding each song
(history, English translation of the lyrics, source descriptions and
list of revisions) is found in various sections of the volume, the link does
not refer to a particular page. Information on each song is
located by referring to the index at the end of the volume.</p>
<p>If the work is related to other
works or song collections this has been indicated by clickable titles
linking to information placed under their CNW numbers. </p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="history">The work&apos;s history</a></h3>
<p>The information on the work&apos;s history includes a brief summary 
of its genesis, dating, the first known performance and sometimes also a few other
performances. Besides the date of the performance, also place,
participants and in some cases information regarding reviews are included.</p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="music">Instrumentation and movements</a></h3>
<p>If there are different instrumentations of the same work, 
this will normally be indicated under each version. 
For an unambiguous identification, 
CNW provides incipits including the first bars of the composition&apos;s main parts
(movements, scenes or similar). Works of a more extensive instrumentation are
provided with incipits in short score. By clicking on an incipit, a larger image
appears in a separate window. Incipits are based on the Carl Nielsen Edition and therefore 
do not necessarily reproduce the exact reading of one particular source.</p>
<p>In records of works of a more complex structure, such as operas divided into acts, scenes and
sections of scenes, the information constitutes a hierarchy of each individual
element that may be folded out by clicking on the &apos;Sections&apos; heading.</p>
<p>A link marked &apos;Carl Nielsen Edition&apos; leads to a PDF file 
of that volume (or volumes) of the
Nielsen Edition containing the composition. Some works, which were originally
published in a composite volume, were also published as soft-bound
off-prints, for example the flute and clarinet concertos. In
these instances, the link refers to the off-prints. </p>

<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="sources">Sources</a></h3>
<p>The overview of sources for each work includes only those from Nielsen&apos;s lifetime, 
and directly related to Nielsen; 
it also includes sources representing his own versions of the works. 
Other composers&apos; arrangements of Nielsen&apos;s works are thus not included.
</p>
<p>The source descriptions are minimal, providing only the most basic information for identification. 
More detailed descriptions are available in the volumes 
of <a href="http://www.kb.dk/en/nb/dcm/cnu/" target="_blank"
title="The Carl Nielsen Edition">The Carl Nielsen Edition (CNU)</a>. To
facilitate the consultation, CNW lists CNU&apos;s source designation (e.g.
&apos;CNU Source <b>A</b>&apos;). The appropriate CNU volumes are available via the mentioned link.</p>
<p>The sources are given a descriptive title indicating the type of source such as 
&apos;Score, autograph, fair copy&apos;. &apos;Autograph&apos; with no further qualification designates that the source&apos;s 
main hand is Nielsen&apos;s. In some cases a name is added after &apos;autograph&apos; 
– for instance, &apos;autograph (Henrik Knudsen)&apos; – 
indicating that the manuscript is not by Nielsen; nor that it is merely 
a copy or transcript of Nielsen&apos;s manuscript: 
the difference between sources listed as a copy and as an autograph (with a name added) 
is that the latter intentionally adds original content to the work. </p>
<p>A systematic classification of the source is given after the title. 
The classification indicates the content type of the source (musical or textual), type of production (manuscript or print),
authority (autograph or copy), position in the compositional process (sketch, draft, fair copy etc.), type of scoring 
(such as score, short score or parts) and completeness (complete, incomplete, excerpt, fragment). 
&apos;Incomplete&apos; is used in cases where the source represents the entire 
composition but some material is missing (for instance, a set of parts with one or more parts missing); &apos;excerpt&apos; 
describes a source intentionally omitting sections of the overall composition, while &apos;fragment&apos; is used when the source 
is left unfinished or portions of it have been lost (for instance, a sketch of the first bars only, or a copy
of the score with one or more pages missing).
</p>


<div class="toplink noprint"><a href="#top">To top of page</a></div>
<h3><a name="bibliography">Bibliography</a></h3>
<p>At present, the bibliography mainly deals with primary texts such as letters to
and from Nielsen as well as Nielsen&apos;s diaries. The information is based on
the forthcoming <a class="abbr" href="javascript:void(0);"><i>Carl Nielsen Brevudgaven</i><span 
class="expan">John Fellow (ed.): <i>Carl Nielsen Brevudgaven</i>. Multivers, Copenhagen 2005-. </span></a>  
(Carl Nielsen Letters).
References do not yet include letters from Nielsen&apos;s latest years but they 
will be added as soon as possible when the complete edition is available. </p>
<p>In so far as it has been possible, references to letters dealing with actual songs have
been listed under the specific song rather than the collection or those collections
in which the song appeared. Letters mentioning a song collection or
unspecified songs from a collection are, however, listed under the collection.</p>
<p>It is our intention to expand the bibliography to also include secondary literature such as 
scholarly literature. Till then we refer the user to
consult the current bibliography on Nielsen literature published in the
journal <a href="https://tidsskrift.dk/index.php/carlnielsenstudies" 
title="Carl Nielsen Studies"><i>Carl Nielsen Studies</i></a>. <br/>
The cumulative bibliography is available at <a
 href="http://www.kb.dk/en/nb/dcm/cnu/cn_bibliography.html">http://www.kb.dk/en/nb/dcm/cnu/cn_bibliography.html</a>.</p>
 <p style="text-align:right; font-style:italic;">The editors</p>
 <p>&#160;</p>
      </div>
      {layout:page-footer($mode)}
    </div>
  </body>
</html>

