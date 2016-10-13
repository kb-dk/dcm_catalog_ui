xquery version "1.0" encoding "UTF-8";

declare namespace loop="http://kb.dk/this/getlist";

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


declare function loop:clean-names ($key as xs:string) as xs:string
{
  (: strip off any text not part of the name (marked with a comma or parentheses) :)
  let $txt := concat(translate(normalize-space($key),',;(','***'),'*')
  return substring-before($txt,'*') 
};

declare function loop:invert-names ($key as xs:string) as xs:string
{
  (: put last name first :)
  let $txt := 
  
  if(contains($key,' ')) then
    concat(normalize-space(substring-after($key,' ')),', ', normalize-space(substring-before($key,' ')))
  else 
    $key 
  return $txt 
};


<html xmlns="http://www.w3.org/1999/xhtml">
	<body>

    <h2>Names</h2>
    <!-- Names appearing in <workDesc> or <sourceDesc> only)-->
    <div>
 
		    {
                    for $c in distinct-values(
            		collection($database)/(m:mei/m:meiHead/m:fileDesc/m:sourceDesc//m:persName 
            		| m:mei/m:meiHead/m:workDesc/m:work//m:persName)
            		/normalize-space(loop:clean-names(string()))[string-length(.) > 0 and not(contains(.,'Carl Nielsen'))])
                    order by loop:invert-names($c)
            	    return
            		  <div>{concat(loop:invert-names($c),'   CNW ')} 
            		  {let $numbers :=
            		  for $n in collection($database)/m:mei/m:meiHead
                         where contains($n/(m:workDesc | m:fileDesc/m:sourceDesc)//m:persName[not(local-name(..)='event' and count(../preceding-sibling::m:event)>0)],$c)
                         order by $n/m:workDesc/m:work/m:identifier[@label='CNW']/string() 
                	     return $n/m:workDesc/m:work/m:identifier[@label='CNW']/string()
                	   return string-join($numbers,', ') 
                   	   } 
                	   </div>

            }
    </div>


  </body>
</html>
