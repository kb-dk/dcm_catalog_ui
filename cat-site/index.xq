xquery version "1.0" encoding "UTF-8";

declare namespace xl="http://www.w3.org/1999/xlink";

declare namespace response="http://exist-db.org/xquery/response";
declare namespace fn="http://www.w3.org/2005/xpath-functions";
declare namespace file="http://exist-db.org/xquery/file";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace ft="http://exist-db.org/xquery/lucene";
declare namespace ht="http://exist-db.org/xquery/httpclient";
declare namespace m="http://www.music-encoding.org/ns/mei";
declare namespace h="http://www.w3.org/1999/xhtml";
declare namespace local="http://kb.dk/this/app";

declare namespace request="http://exist-db.org/xquery/request";

import module namespace loop="http://kb.dk/this/getlist" at "./main_loop.xqm";
import module namespace app="http://kb.dk/this/listapp" at "./list_utils.xqm";
import module namespace filter="http://kb.dk/this/app/filter" at "./filter_utils.xqm";
import module namespace layout="http://kb.dk/this/app/layout" at "./layout.xqm";

declare option exist:serialize "method=xml media-type=text/html"; 

declare variable $coll   := request:get-parameter("c","") cast as xs:string;
declare variable $genre  := request:get-parameter("genre","") cast as xs:string;
declare variable $query  := request:get-parameter("query","");
declare variable $page   := request:get-parameter("page", "1") cast as xs:integer;
declare variable $number := request:get-parameter("itemsPerPage","20") cast as xs:integer;
declare variable $mode   := request:get-parameter("mode","navigation") cast as xs:string;

declare variable $vocabulary  := doc(concat("/db/cat-site/",$coll,"/keywords.xml"));
(: declare variable $database := concat("/db/cat-site/",$coll,"/data"); :)
declare variable $database := concat("/db/data-",$coll);
declare variable $html     := doc(concat("/db/cat-site/",$coll,"/navigation.html"));
declare variable $from     := ($page - 1) * $number + 1;
declare variable $to       :=  $from      + $number - 1;


declare variable $sort-options :=
(<option value="null,work_number">Work number</option>,
<option value="null,title">Title</option>,
<option value="date,title">Year</option>
);


declare function local:format-reference(
$doc as node(),
$pos as xs:integer ) as node() 

{

let $genres2 := 
for $genre in 
distinct-values($doc//m:workList/m:work/m:classification/m:termList/m:term[contains(string-join($vocabulary//m:taxonomy/m:category/m:category/m:desc," "),.) and normalize-space(.)!='']/string())
where string-length($genre) > 0   
return
$genre

let $class := 
for $genre in $genres2
return 
translate(translate($genre,' ,','_'),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')


(: Level 1 genres actually not used at the moment :) 
let $genres1 := 
for $genre in $genres2
return 
$vocabulary//m:taxonomy/m:category/m:desc[.=$genre]/ancestor::m:category[1]/string()

let $class1 := 
for $genre in $genres1
return 
translate(translate(normalize-space($genre),' ,','_'),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')
(: End not used :)


let $genre_boxes := 
for $genre at $pos in $genres2 
return 
<div class="genre_list">
    <a class="{$class[$pos]} genre_indicator abbr"><img src="style/images/spacer.png" border="0" width="12" height="12"/><span class="expan">{$genre}</span></a>
</div>

let $date_output :=
if($doc//m:workList/m:work/m:creation/m:date/@notbefore!='' or $doc//m:workList/m:work/m:creation/m:date/@notafter!=''
or $doc//m:workList/m:work/m:creation/m:date/@startdate!='' or $doc//m:workList/m:work/m:creation/m:date/@enddate!='') then
concat(substring($doc//m:workList/m:work/m:creation/m:date/@notbefore,1,4),
substring($doc//m:workList/m:work/m:creation/m:date/@startdate,1,4),
'-',
substring($doc//m:workList/m:work/m:creation/m:date/@enddate,1,4),
substring($doc//m:workList/m:work/m:creation/m:date/@notafter,1,4))
else
substring($doc//m:workList/m:work/m:creation/m:date/@isodate,1,4)

(: Composer currently not used :)
let $composer :=
<div class="composer">{$doc//m:workList/m:work/m:contributor[@role='composer'][1]/text()}&#160;</div>

(: Prefer low resolution incipits if available; otherwise just use the first available image :)
let $img := if ($doc//m:workList/m:work//m:incip/m:graphic[@target and @targettype='lowres']) then
$doc//m:workList/m:work//m:incip/m:graphic[@target and @targettype='lowres'][1]
else $doc//m:workList/m:work//m:incip/m:graphic[@target][1]

(: some magic needed to resize incipit :)
let $incip := if ($img) then
<div class="incip_wrap"><img class="incip_scaled" onload="this.width=this.naturalWidth*0.6;this.style.display='block'" src="{$img/@target}" /></div>
else ''

let $ref   :=
(:<table class="result_table" onclick="location.href='{concat('./document.xq?doc=',util:document-name($doc))}'" cellspacing="0" cellpadding="0">:)
    <table class="result_table" onclick="location.href='{concat('./document.xq?n=',xmldb:encode-uri(app:get-work-number($doc)))}'" cellspacing="0" cellpadding="0">
        <tr class="result_row">
            <td class="list_id result_cell">
                {app:get-edition-and-number($doc)}{" "}
            </td>
            <td class="result_cell" rowspan="2">
                <div class="date">&#160;{$date_output}</div>
                <div class="title">
                    {app:public-view-document-reference($doc)}{" "}
                </div>
                {$incip}
            </td>
        </tr>
        <tr  class="result_row">
            <td class="list_id result_cell genre_cell">
                <div class="info_bar">
                    {$genre_boxes}&#160;
                </div>
            </td>
        </tr>
    </table>
    return $ref
    
    };
    
    <html xmlns="http://www.w3.org/1999/xhtml">
        {layout:head($html//h:title/text(),(<link rel="stylesheet" type="text/css" href="style/public_list_style.css"/>),false())}
        <body class="list_files" onload="initialize();">
            
            <div id="all">
                {layout:page-head-doc($html)}
                {layout:page-menu($mode)}
                
                <div id="main">
                    <div class="content_box">
                        {
                        let $list := loop:getlist($database,$genre,$query)
                        return
                        (
                        <div class="files_list">
                            <div class="filter">
                                {filter:print-filters($database,string($number),$genre,$query)}
                            </div>
                            <div class="spacer"><div>&#160;</div></div>
                            <div class="results">
                                <div class="nav_bar noprint">
                                    {app:navigation($sort-options,$list)}
                                </div>
                                <div class="filter_elements">
                                    {filter:filter-elements()}
                                </div>
                                
                                <!-- temporary error message -->
                                <!--<div style="background-color:#faa;border: 1px solid #f88;font-size: 8pt; padding: 4px;">Please note: We are currently updating this service. Information may be temporarily missing or misplaced.<br/>
               We apologize and hope to fix any problems within a few days.
           </div>-->
                                
                                {
                                for $doc at $count in $list[position() = ($from to $to)]
                                return local:format-reference($doc,$count)
                                }
                            </div>
                        </div>)
                        }
                    </div> 
                </div> 
                
                {layout:page-footer($mode)}
                
            </div> 
            
        </body>
    </html>
    