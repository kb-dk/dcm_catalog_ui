xquery version "1.0" encoding "UTF-8";

module  namespace          dat="http://kb.dk/these/dates";
declare variable $d:coll   := request:get-parameter("c","") cast as xs:string;


declare function dat:not_before() as xs:integer {
  let $year := 
    if($d:coll = "cnw") then
      return 1880
    else if ($d:coll = "hartw") then
      return 1805
    else if ($d:coll = "nwgw") then
      return 1817
    else if (contains($d:coll,"sch")) then
      return 1708

  return $year
};


declare function dat:not_after() as xs:integer {
  let $year := 
    if($d:coll = "cnw") then
      return 1931
    else if ($d:coll = "hartw") then
      return 1900
    else if ($d:coll = "nwgw") then
      return 1890
    else if (contains($d:coll,"sch")) then
      return 1776

  return $year
};
