xquery version "1.0" encoding "UTF-8";

declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";
declare namespace fn="http://www.w3.org/2005/xpath-functions";
declare namespace file="http://exist-db.org/xquery/file";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace ft="http://exist-db.org/xquery/lucene";
declare namespace ht="http://exist-db.org/xquery/httpclient";

declare namespace local="http://kb.dk/this/app";
declare namespace m="http://www.music-encoding.org/ns/mei";

declare option exist:serialize "method=xml media-type=text/html"; 

declare variable $database := "/db/cnw/data";

declare function local:simplify-list ($key as xs:string) as xs:string
{
  (: strip off anything following the first volume reference :)
  let $txt := concat(translate(normalize-space($key),' ,;()-–/','********'),'*')
  return substring-before($txt,'*')
};


declare function local:format-main-title ($key as xs:string) as node()
{
  let $txt :=
  if(fn:contains($key,', opus')) then
    <span>
        <i>{fn:substring-before($key,', opus')}</i>
        {fn:concat(', opus',fn:substring-after($key,', opus'))}
    </span>
  else 
    <i>{$key}</i>
  return $txt 
};



<html xmlns="http://www.w3.org/1999/xhtml">
	<body>
	
		<h2>FS Numbers</h2>
		<table>
		    {
            	    for $c in collection($database)/m:mei/m:meiHead/m:workList/m:work[m:identifier[@label='FS']]
                    order by number(translate(local:simplify-list($c/m:identifier[@label='FS']),'abcdefghijklmnopqrstuvwxyz','')), 
                    translate(local:simplify-list($c/m:identifier[@label='FS']),'01234567890','') 
            	    return 
            	       <tr>
            	           <td>{$c/m:identifier[@label='FS']/string()}</td>
            	           <td>{
            	               if(not($c/m:title[@type='alternative']) and $c/m:classification/m:termList/m:term='Song'
            	               and not(fn:contains($c/m:identifier[@label='CNW'],'Coll.'))) then
            	                   (: no alternative title, i.e. title is first line :)
                    	           $c/m:title[@type='main' or not(@type)][1]/string()
                    	       else
                    	           <span>{local:format-main-title($c/m:title[@type='main' or not(@type)][1]/string())}
                    	             {$c/m:title[@type='alternative'][1]}
                    	           </span>
            	           }
            	           <!--</td>
            	           <td>-->{fn:concat(' CNW ',$c/m:identifier[@label='CNW']/string())}</td>
            	       </tr>

            }
        </table>
  </body>
</html>
