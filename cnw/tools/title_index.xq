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

declare function local:title-first-line ($titlestmt as node()) as node()
{
  (: title (first line) :)
  let $txt := 
  
  if($titlestmt/m:title[@type='main' or not(@type)]/string() and $titlestmt/m:title[@type='alternative']/string()) then
    element span {
        element i {$titlestmt/m:title[@type='main' or not(@type)][1]/string()},
        fn:concat(' (',$titlestmt/m:title[@type='alternative'][1]/string(),') ')
    }
  else 
    element i {
        $titlestmt/m:title[@type='main' or not(@type)][1]/string(), 
        ' '
    }
  return $txt 
};



<html xmlns="http://www.w3.org/1999/xhtml">
	<body>

    <h2>Titles and first lines</h2>
    <div>
            
		    {

            	    for $c in collection($database)//m:workDesc/m:work
                    order by $c/m:titleStmt/m:title[1]/string()
            	    return
            	       <div>
            	       {
            	           (: title (first line) :)
                            let $output := 
                              if(fn:string-length($c/m:titleStmt/m:title[@type='main' or not(@type)][1])>0 and fn:string-length($c/m:titleStmt/m:title[@type='alternative'][1])>0) then
                                <span>
                                    <i>{$c/m:titleStmt/m:title[@type='main' or not(@type)][1]/string()} </i>
                                    {fn:concat(' (',$c/m:titleStmt/m:title[@type='alternative'][1]/string(),') ')
                                }</span>
                              else 
                                <i>{$c/m:titleStmt/m:title[@type='main' or not(@type)][1]/string()} </i> 

                            return $output
                         }
                         { fn:concat(' CNW ',$c/m:identifier[@label='CNW']/string())}
                         </div>

            }
    </div>

  </body>
</html>
