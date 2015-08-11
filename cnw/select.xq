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

declare function loop:simplify-list ($key as xs:string) as xs:string
{
  (: strip off anything following the first volume reference :)
  let $txt := concat(translate(normalize-space($key),' ,;/()-–','********'),'*')
  return substring-before($txt,'*')
};

declare function loop:clean-volumes ($key as xs:string) as xs:string
{
  (: format the volume numbers for display :)
  let $txt := concat(translate(normalize-space($key),' ,;()','*****'),'*')
  return substring-before($txt,'*')
};



<html xmlns="http://www.w3.org/1999/xhtml">
	<body>
	
		<div>
		
CNW: <select name="cnw">
        <option value=""/>
		    {
            	    for $c in distinct-values(
            		collection($database)//m:workDesc/m:work/m:identifier[@label='CNW']/string()[string-length(.) > 0 and translate(.,'0123456789','')=''])
                    order by number($c)
            	    return 
            	       <option value="{$c}">{$c}</option>

            }
       </select>

Opus: <select name="opus">
        <option value=""/>
		    {
            	    for $c in distinct-values(
            		collection($database)//m:workDesc/m:work/m:identifier[@label='Opus']/string()[string-length(.) > 0])
                    order by number(translate($c,'abcdefghijklmnopqrstuvwxyz',''))
            	    return 
            	       <option value="{$c}">{$c}</option>

            }
       </select>

FS: <select name="fs">
        <option value=""/>
		    {
            	    for $c in distinct-values(
            		collection($database)//m:workDesc/m:work/m:identifier[@label='FS']/loop:simplify-list(string())[string-length(.) > 0])
                    order by number(translate(loop:simplify-list($c),'abcdefghijklmnopqrstuvwxyz','')), translate(loop:simplify-list($c),'01234567890','') 
            	    return 
            	       <option value="{$c}">{$c}</option>

            }
       </select>

CNS: <select name="cns">
        <option value=""/>
		    {
            	    for $c in distinct-values(
            		collection($database)//m:workDesc/m:work/m:identifier[@label='CNS']/string()[string-length(.) > 0])
                    order by number($c)
            	    return 
            	       <option value="{$c}">{$c}</option>

            }
       </select>

CNU: <select name="cnu">
        <option value=""/>
		    {
            	    for $c in distinct-values(
            		collection($database)//m:workDesc/m:work/m:identifier[@label='CNU']/loop:clean-volumes(string())[string-length(.) > 0])
                    order by substring-before(loop:simplify-list($c),'/'), number(substring-after(loop:simplify-list($c),'/')) 
            	    return 
            	       <option value="{$c}">{$c}</option>

            }
       </select>

    </div>

    <div>
Names: <select name="names">
        <option value=""/>
		    {
            	    for $c in distinct-values(
            		collection($database)//m:persName[not(name(..)='respStmt' and name(../..)='pubStmt' and name(../../..)='fileDesc')]
            		/loop:clean-names(string())[string-length(.) > 0 and not(contains(.,'Carl Nielsen'))])
                    order by loop:invert-names($c)
            	    return 
            	       <option value="{$c}">{loop:invert-names($c)}</option>

            }
        </select>
    </div>

  </body>
</html>
