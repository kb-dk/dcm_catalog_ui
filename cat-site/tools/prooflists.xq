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
  let $txt := concat(translate(normalize-space($key),' ,;()-–','*******'),'*')
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
<!--	
    <div>
    CNS: 
		    {
(:            	    for $c in distinct-values(
            		collection($database)//m:workList/m:work/m:identifier[@label='CNS']/string()[string-length(.) > 0
            		and not(number(.))])
                    order by number($c)
            	    return 
            	       <div>{$c}</div>
:)
            }

    </div>

    <h2>CNW numbers</h2>  
    <div>
		    {
(:
                    for $c in distinct-values(
            		collection($database)//m:workList/m:work/m:identifier[@label='CNW']/string()[string-length(.) > 0 and translate(.,'0123456789','')=''])
                    order by number($c)
            	    return 
            	       <div>{$c} </div> 
:)
            }

    </div>
-->    


    <h2>Names</h2>
    <div>
            
		    {

                    for $c in distinct-values(
            		collection($database)//(m:manifestationList//m:persName | m:work//m:persName)
            		/normalize-space(loop:invert-names(loop:clean-names(string())))[string-length(.) > 0 and not(contains(.,'Carl Nielsen'))])
                    order by $c
            	    return
            	       <div>{$c}</div>

            }
    </div>


<!--    
    <h2>Instruments</h2>
    <div>
 
		    {
(:		    
            	    for $c in distinct-values(
            		collection($database)//(m:instrVoice)
            		/normalize-space(.))
                    order by $c
            	    return 
            	       <div>{$c}</div>
:)
            }
    </div>
-->

  </body>
</html>
