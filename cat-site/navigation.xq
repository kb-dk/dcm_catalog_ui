xquery version "1.0" encoding "UTF-8";

declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";

declare variable $coll   := request:get-parameter("c","") cast as xs:string;
declare variable $params := request:get-parameter-names();
declare variable $uri    := "index.xq";

let $qlist := 
    for $p in $params 
        let $val := request:get-parameter($p, "")
        for $v in $val
            return 
                if ($p != "c") then 
                    concat($p,"=",$v)
                else 
                    ""
let $qstring := string-join($qlist,"&amp;")
let $uri := 
        if (normalize-space($qstring)) then
            concat($uri,"?",$qstring)
        else
            $uri
        
return
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <!--<meta http-equiv="refresh" content="5;url=index.xq"/>-->
        <!--<meta http-equiv="refresh" content="0;url={$uri}"/>-->
        <meta http-equiv="Content-Type" content="application/xhtml+xml;charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <script type="text/javascript">
            window.location.href = "{$uri}";
        </script>
        <title>Redirecting</title>
    </head>
    <body>
        <p>Redirecting to: {$uri}</p>
        <p>If you are not redirected automatically, follow this <a href='{$uri}'>link to the catalogue</a></p>
    </body>
</html>