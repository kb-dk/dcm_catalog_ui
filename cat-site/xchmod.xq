xquery version "3.1";
import module namespace dbutil="http://exist-db.org/xquery/dbutil" at "xmldb:exist:///db/apps/fundocs/modules/dbutil.xqm";
dbutil:find-by-mimetype(xs:anyURI("/db/cat-site"), "application/xquery", function($resource) { sm:chmod($resource, "rwxr-xr-x")}),
dbutil:scan-collections(xs:anyURI("/db/cat-site"), function($collection) { sm:chmod($collection, "rwxr-xr-x")}),
dbutil:find-by-mimetype(xs:anyURI("/db/data-cnw"), "application/xquery", function($resource) { sm:chmod($resource, "rwxr-xr-x")}),
dbutil:scan-collections(xs:anyURI("/db/data-cnw"), function($collection) { sm:chmod($collection, "rwxr-xr-x")}),
dbutil:find-by-mimetype(xs:anyURI("/db/data-hartw"), "application/xquery", function($resource) { sm:chmod($resource, "rwxr-xr-x")}),
dbutil:scan-collections(xs:anyURI("/db/data-hartw"), function($collection) { sm:chmod($collection, "rwxr-xr-x")}),
dbutil:find-by-mimetype(xs:anyURI("/db/data-nwgw"), "application/xquery", function($resource) { sm:chmod($resource, "rwxr-xr-x")}),
dbutil:scan-collections(xs:anyURI("/db/data-nwgw"), function($collection) { sm:chmod($collection, "rwxr-xr-x")}),
dbutil:find-by-mimetype(xs:anyURI("/db/data-schw"), "application/xquery", function($resource) { sm:chmod($resource, "rwxr-xr-x")}),
dbutil:scan-collections(xs:anyURI("/db/data-schw"), function($collection) { sm:chmod($collection, "rwxr-xr-x")}),
sm:chmod(xs:anyURI("/db/cat-site/xchmod.xq"), "rwxr-x---"),
sm:chmod(xs:anyURI("/db/cat-site/reindex.xq"), "rwxr-x---")
