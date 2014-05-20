xquery version "1.0" encoding "UTF-8";

import module namespace layout="http://kb.dk/this/app/layout" at "./cnw-layout.xqm";
declare option exist:serialize "method=xml media-type=text/html;charset=UTF-8";
declare variable $mode   := request:get-parameter("mode","introduction") cast as xs:string;

<html xmlns="http://www.w3.org/1999/xhtml">
  {layout:head("Introduction: Carl Nielsen Works Catalogue (CNW)",())}
  <body class="text">
    <div id="all">
      {layout:page-head("CNW","Carl Nielsen Works Catalogue")}
      {layout:page-menu($mode)}
      <div id="main">
      <h1>Introduction</h1>
<h2>Methodology
and work status</h2>
<p>Often Nielsen’s works cannot be
dated precisely. They were composed over longer periods, and at a later
date
they were sometimes revised to such an extent that it hardly makes
sense to
assign them to a particular time in Nielsen’s production. Basically the
catalogue is arranged according to genre rather than chronologically
though a
certain chronology has been sought within each genre. </p>
<p>The disposition of a catalogue
of
works presents a series of fundamental difficulties related to the Work
concept. The catalogue must necessarily operate with an either­–or: a
composition
may be seen either as an independent work – hence assigned a work
number – or
may fall outside the chosen delimitation and does not therefore appear
with its
own work number. </p>
<p>In essence CNW includes
compositions
which are complete in structure though not necessarily so in detail.
Thus
fragments of compositions, which as far as is known were never
finished, are
not listed. Those instances, where excerpts of works – either in
original form
or as arrangements – have had a separate and significant reception
history
independent of their original context, are more difficult to solve.
This
applies to a number of songs which originally were composed in relation
to
stage music but were disseminated and became known as independent
works. In
addition, CNW distinguishes between instrumental and vocal music:
instrumental
excerpts of larger works are essentially not interpreted as independent
works;
thus <i>Suite of ‘Aladdin’</i>, for
instance, is placed under <i>Music for Adam
Oehlenschlägers Play ‘Aladdin or the Wonderful Lamp’</i> <a class="work_number_reference" href="document.xq?doc=cnw0017.xml">17</a>.
Similarly, <i>The Fog is Lifting</i> is
only to be found
in relation to <i>Music for Helge Rode’s
Play ‘The Mother’</i> <a class="work_number_reference" href="document.xq?doc=cnw0018.xml">18</a>, in spite of the fact that <i
>The Fog is Lifting</i> in various
arrangements is far better known as
in independent piece than the stage music for the play as a whole. The
delimitation has been chosen since excerpts and arrangements constitute
a
continuum in which it is difficult to draw a clear line: from a complex
version
of the work or the grouping of a series of movements of it (e.g. the <i
>Aladdin Suite</i>), over single movements
which sometimes are performed independently (e.g. <i>The
Cockerel’s Dance </i>from<i>
Masquerade</i> <a class="work_number_reference" href="document.xq?doc=cnw2.xml">2</a>) and to actual arrangements of such movements
(e.g. <i>The Fog is Lifting</i>).</p>
<p>Regarding songs that have their
origin in larger contexts, another approach has been chosen. Such songs
are
also listed in the catalogue as separate works, that is, if they were
also
published outside their original context, either separately or as part
of a
collection of songs. One good example worth mentioning is <i
>There’s a Fleet of Floating Islands</i> <a class="work_number_reference" href="document.xq?doc=cnw0237.xml">237</a>
that originally was
composed for the play, <i>The Mother</i>
<a class="work_number_reference" href="document.xq?doc=cnw0018.xml">18</a>, but which was furthermore published as part of an excerpt of the
play in
piano score and as a four-part arrangement for mixed choir. Such songs
have been
assigned with their own CNW number, that is, as independent works, even
though
they also appear as part of another work. The same applies to those
songs which
were published in collections, regardless of whether they were
publications
including songs by various composers or collections only including
songs by
Nielsen, and regardless of whether the songs were also published
separately.
These collections make up a continuum ranging from existing separate
songs,
which were chosen for publication in a broader context (e.g. <i
>Folkehøjskolens Melodibog</i>), to
collections that were composed during a coherent period of time and of
a more
cyclic character (e.g. <i>Six Songs to Texts
by Ludvig Holstein</i>, Op. 10). The songs have consistently been
listed as
separate works (including, of course, the information on the
collection/s of
which they were part) as 1) it is difficult to draw a clear line
between grouped
separate songs and actual cycles of songs, and 2) since the songs
sometimes are
also found in other contexts. These work criteria imply that a song
such as <i>Jeronimus’ Song</i> (‘Fordum
var her Fred
paa Gaden’) from the opera <i>Masquerade</i>
<a class="work_number_reference" href="document.xq?doc=cnw0002.xml">2</a>, is <i>not</i> to be found in CNW as
an
individual work since it, in spite of its popularity in Nielsen’s
lifetime, was
never published separately. In other words, it is the source situation
which
determines the evaluation of a song’s status as a work and not its
reception
history.</p>
<p>Though the song collections
thus do
not occur as works assigned one individual number in CNW, they are
described
separately, however. The description of a song collection is contained
in one single record but includes
in
addition a listing of the collection’s contents – that is, those songs
which the
collection contains – as well as the sources related that particular
collection. Thus the sources of the collections are not listed under
each song
but are found under the collection or collections in which the song
appeared.
The collection is located by clicking on the title of the collection
appearing
under the ‘Contained in:’ tab. However, the description of a single
song of a
collection is found by proceeding to the song’s title in the index of
the
description of the collection (by clicking the ‘Contains:’ tab).</p>
<p>Different arrangements of the
same
composition are not defined as independent works but are included under
the
same CNW number, also when it comes to songs. This overall
understanding of
works implies also that there is not a one-to-one agreement between a
work in
CNW and an edition in CNU in all instances, but that there may be
several CNU editions
under the same CNW number. This applies to <i>Hjemvee</i>
(better known with the first line ‘Underlige Aftenlufte’) <a class="work_number_reference" href="document.xq?doc=cnw0205.xml">205</a>, for
instance,
that has been published in CNU in four distinct arrangements of the
same
melody, all of which are listed under the same number in CNW. Nielsen’s
second
and lesser known melody to the same text has, on the other hand, its
own number
(<a class="work_number_reference" href="document.xq?doc=cnw0296.xml">296</a>).</p>
<h2>How
to use the catalogue</h2>
<p>The list of work titles is the
catalogue’s
primary entry to the records. In a column to the left of the titles it
is
possible to modify and limit the search results while at the top of the
list there
are different settings as to how the results may be displayed.</p>
<h3>Delimitation
and searching</h3>
<p>On the menu at the left side of
the display,
the following possibilities to change or limit the search in the
catalogue are
listed:</p>
<ul>
<li>Keywords:
free text search (may for example be used for searching title keywords,
for a
particular CNW number or records mentioning a particular person). The
search is
case insensitive and search words may be truncated with an asterisk (*).</li>
<li>Year
of composition: the search may be limited to works that are composed in
a
particular period. The required period is obtained by adjusting the
slides and then
by clicking the ‘Search’ button. Please note that searching by year
only includes
that year which marks the end of the period. A work listed as having
been
composed between 1880 and 1883 will thus be presented in a search for
works
from the period 1882–85, for instance, and not 1880–82. Note also that
when
searching for year of composition, undated works will not turn up.</li>
<li>Genre:
by clicking on a genre designation the search is limited to those works
that
are listed under that particular genre as the work’s primary genre.
Several works
may have the genre added as a secondary designation. These records are
found by
searching the genre in the free text search field instead. </li>
<li>Anthologies:
as a standard the list of search results does not include anthologies
(song
collections) as they are not recorded as works with a CNW number (see
work
definition above). In order to include such collections in the search,
the
field ‘Include anthologies’ must be ticked.</li>
</ul>
<p>All search limitations function
additively,
that is, a simultaneous use of several search parameters confines the
result
further (logically ‘AND’). Each delimiting parameter (filter) is shown
at the
top of the list of search results when the search has been completed. Each filter may be removed
one at a time by
clicking on the [delete] symbol at the filter in question, thus
expanding the
search again. Filters may be removed all at once by clicking on the red
‘Reset
all’ button on the list of filters. </p>
<h3>Display
and sorting of search results</h3>
<p>[to be included]</p>
<h2>The
structure and contents of each record</h2>
<p>A certain amount of information
is
displayed directly on each record; for the sake of clarity, however,
other data
may be hidden under the tabs ‘Music’, ‘Performances’, ‘Sources’,
‘Primary texts’
and ‘Bibliography’ with a plus sign (+). By clicking on the plus sign
the
hidden information will fold out and may be closed again. </p>
<h3>Work titles</h3>
<p>Precise titles are kept thus
reproducing
Nielsen’s original orthography. They reveal changes in Nielsen’s
spelling and
punctuation habits throughout his life and are apparent in titles such
as <i>Har Haand du lagt paa Herrens Plov</i>
<a class="work_number_reference" href="document.xq?doc=cnw0173.xml">173</a>
and <i>Jeg gik i marken og vogtede får</i>
<a class="work_number_reference" href="document.xq?doc=cnw0327.xml">327</a>. From an orthographical point of view the titles overall expose a
heterogeneous and a seemingly inconsistent practice which, however, has
been retained
rather than modernising it, partly because it would be just as dated
(though to
a later time) and partly because modernisation is also a <b>question
of degree</b> which in the extreme would not only include
spelling and punctuation but also the choice of words.</p>
<p>Several of Nielsen’s songs were
published in various contexts with distinct orthography. Thus, for
example, <i>Melodier til Sangbogen Danmark</i>
employs
the older orthography while <i>Folkehøjskolens
Melodibog</i> uses the modern. In these instances CNW reproduces
the
orthography of the earliest published title. In the description of the
contents
of the song collections the titles are rendered as in the collection
concerned.</p>
<p>On the other hand, titles,
which are
similar to genre designations, have – as have instrument designations –
been
standardised and modernised such as <i>Kvartet
for to violiner, bratsch og cello</i> <a class="work_number_reference" href="document.xq?doc=cnw49.xml">49</a>.</p>
<p>Many of the songs Nielsen never
gave
an actual title, and in these cases the first line of the text has been
added
as title in quotation marks. In the remaining instances the text
incipit is
given as the alternative title, also when the song is better known by
its first
line (e.g. <i>Hjemvee</i> <a class="work_number_reference" href="document.xq?doc=cnw205.xml">205</a>), better
known as ‘Underlige Aftenlufte!’).</p>
<h3>Identification</h3>
<p>In addition to the actual CNW
number, the catalogue provides each work’s number in an array of other
contexts
including Nielsen’s own opus numbers, [Fog/Schousboe no.] and the
work’s number
in the Carl Nielsen Collection (CNS) in The Royal Library. </p>
<p>Furthermore, each record links
to
the Nielsen Edition (CNU), the numbers of which signify series and
volume. <b>Concerning the songs, also their
numbers
preceded by a comma are given</b>. If several versions occur in
the same CNU
volume these are separated by yet a comma. Versions in other volumes
are
divided by a semicolon. Thus ‘CNU III/5, 146, 229; III/6, 324’ refers
to the
numbers 146, 229 and 324 in the Nielsen Edition of which the two
first-mentioned are in Series III (songs) volume 5 whereas the latter
is in
Series III volume 6.</p>
<p>Then the name of the text
author follows,
if any. </p>
<p>Each song record includes a
link
titled ‘Carl Nielsen Edition (editorial texts)’ referring to a PDF-file
of the
text volume to all the songs. Since the information regarding each song
(historical information, English translation, source descriptions and
list of
revisions) is found in various sections of the volume, the link does
not refer
to a particular page in the volume. Information on each song must be
located by
referring to the index at the end of the volume.</p>
<p>If the work is related to other
works or song collections this has been indicated by clickable titles
linking
to information on their CNW numbers. </p>
<h3>The
work’s history</h3>
<p>In addition to the work’s
genesis,
the brief summary also includes information on the dating of the
composition of
the work, the first known performance and sometimes also a few other
performances. Besides the date of the performance, also place,
participants and
in some cases information regarding reviews are included.</p>
<h3>Instrumentation
and sequence of movements</h3>
<p>If a work occurs in different
instrumentations, this will normally be indicated under each version of
the
work. The instrumentation is given using abbreviations (see list of
abbreviations). For an unambiguous identification of the works CNW
provides
incipits, that is, the first couple bars of the work’s main parts
(movements,
scenes or similar). Works of a more extensive instrumentation are
provided with
incipits in short score. By clicking on an incipit, a larger edition
appears in
a separate window.</p>
<p>In records of works of a more
complex structure, such as operas divided into acts, scenes and
sections of
scenes, the information constitutes a hierarchy of each individual
element that
may be folded out by clicking on the ‘Sections’ heading.</p>
<p>A link with the tag ‘Related
resources’ leads to a PDF-file with that volume (or volumes) of the
Nielsen
Edition which contains the work. Some works, which were originally
published in
a composite volume, were also published as <b>soft-bound
off-prints</b>, for example the flute and clarinet concertos. In
these
instances the link refers to <b>the
off-prints</b>. </p>
<h3>Sources</h3>
<p>The overview of sources for
each
work includes only sources from Nielsen’s lifetime.</p>
<p>The source descriptions are
minimal,
only including information necessary for identifying the sources. More
detailed
descriptions of the sources are provided in the Nielsen Edition. To
facilitate
the consultation of CNW also lists the CNU’s source designation (e.g.
‘CNU
Source <b>A</b>’). The appropriate CNU
volumes are available via the mentioned link (see <i>Music</i>).</p>
<h3>Bibliography</h3>
<p>At present, the bibliographical
information deals with primary texts; that is, first of all, letters to
and
from Nielsen as well as Nielsen’s diaries. The information is based on
the
forthcoming <i>Carl Nielsen Letters</i>.
The
references do not include letters from Nielsen’s latest years but they
will be added
as soon as possible when the complete edition is available. 
</p>
<p>In so far
as it has
been possible, references to letters dealing with actual songs have
been listed
under the specific song rather than the collection or those collections
in
which the song appeared. Letters mentioning a song collection or
unspecified
songs from a collection are, however, listed under the collection. It
is the
intention to expand the bibliography including secondary literature,
that is,
scholarly literature on the works. Till then we refer the user to
consult the
current bibliography on Nielsen literature which is published in the
journal <i>Carl Nielsen Studies</i>. The
cumulative
bibliography is available at &lt;<a
 href="http://www.kb.dk/en/nb/dcm/cnu/cn_bibliography.html">http://www.kb.dk/en/nb/dcm/cnu/cn_bibliography.html</a>&gt;.</p>
      </div>
      {layout:page-footer($mode)}
    </div>
  </body>
</html>

