xquery version "3.1";

declare namespace xdb="http://exist-db.org/xquery/xmldb";

let $cnw := xdb:reindex('/db/data-cnw')
let $hartw := xdb:reindex('/db/data-hartw') 
let $nwgw  := xdb:reindex('/db/data-nwgw') 
let $schw  := xdb:reindex('/db/data-schw')

return
    <div>
        <p>cnw {$cnw}</p>
        <p>hartw {$hartw}</p>
        <p>nwgw {$nwgw}</p>
        <p>sch2 {$schw}</p>
    </div>
