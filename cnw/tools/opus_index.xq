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



<html xmlns="http://www.w3.org/1999/xhtml">
	<body>
	
		<h2>Opus Numbers</h2>
		<table>
		    {
            	    for $c in collection($database)//m:workDesc/m:work[m:identifier[@label='Opus']]
                    order by number(translate($c/m:identifier[@label='Opus'],'abcdefghijklmnopqrstuvwxyz',''))
            	    return 
            	       <tr>
            	           <td>{
            	           if(contains($c/m:identifier[@label='Opus'],'.')) then
            	               ''
            	           else 
            	               $c/m:identifier[@label='Opus']
            	           }</td>
            	           <td>{
            	           if(contains($c/m:identifier[@label='Opus'],'.')) then
            	               <span>{fn:concat($c/m:identifier[@label='Opus'],' ')}
                	               <i>{fn:substring-before($c/m:titleStmt/m:title[@type='main' or not(@type)][1],', opus')}</i>
            	               </span>
                           else
                                <i>{fn:substring-before($c/m:titleStmt/m:title[@type='main' or not(@type)][1],', opus')}</i>
                                }<!--</td>
            	           <td>-->{fn:concat(' CNW ',$c/m:identifier[@label='CNW']/string())}</td>
            	       </tr>

            }
        </table>
  </body>
</html>
