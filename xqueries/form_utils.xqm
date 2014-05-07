xquery version "1.0" encoding "UTF-8";

module namespace forms="http://kb.dk/this/formutils";

declare namespace request="http://exist-db.org/xquery/request";

declare variable $forms:notbefore := request:get-parameter("notbefore",   "") cast as xs:string;
declare variable $forms:notafter  := request:get-parameter("notafter",    "") cast as xs:string;
declare variable $forms:coll      := request:get-parameter("c",           "") cast as xs:string;
declare variable $forms:query     := request:get-parameter("query",       "");
declare variable $forms:page      := request:get-parameter("page",        "1") cast as xs:integer;
declare variable $forms:number    := request:get-parameter("itemsPerPage","20") cast as xs:integer;
declare variable $forms:genre     := request:get-parameter("genre",       "")   cast as xs:string;
declare variable $forms:sortby    := request:get-parameter("sortby",      "null,work_number") cast as xs:string;
declare variable $forms:from      := ($forms:page - 1) * $forms:number + 1;
declare variable $forms:to        :=  $forms:from      + $forms:number - 1;

declare variable $forms:anthologies := request:get-parameter("anthologies","no") cast as xs:string;

declare variable $forms:anthology-options := 
(<option value="no">Exclude anthologies</option>,
<option value="yes">Include anthologies</option>);


declare variable $forms:published_only := 
request:get-parameter("published_only","") cast as xs:string;

declare function forms:pass-as-hidden() as node()* {
  let $inputs :=
    (
    <input name="published_only" type="hidden" value="{$forms:published_only}"   />,
    <input name="c"              type="hidden" value="{$forms:coll}"   />,
    <input name="query"          type="hidden" value="{$forms:query}"  />,
    <input name="page"           type="hidden" value="{$forms:page}"   />,
    <input name="itemsPerPage"   type="hidden" value="{$forms:number}" />,
    <input name="genre"          type="hidden" value="{$forms:genre}" />,
    <input name="notbefore"      type="hidden" value="{$forms:notbefore}" />,
    <input name="notafter"       type="hidden" value="{$forms:notafter}" />,
    <input name="sortby"         type="hidden" value="{$forms:sortby}" />,
    <input name="anthologies"    type="hidden" value="{$forms:anthologies}" />
    )
    return $inputs
};

declare function forms:emit-select-form(
  $id    as xs:string,
  $param as xs:string,
  $value as xs:string,
  $options as node()*)  as node()* 

  {    
  let $form := 
  <form action="" id="{$id}" style="display:inline;float:right;">
    <select name="{$param}" onchange="this.form.submit();return true;"> 
      {
	for $opt in $options
	let $option:=
	  if($opt/@value/string()=$value) then
	    element option {
	      attribute value {$opt/@value/string()},
	      attribute selected {"selected"},
	      $opt/string()}
	  else
	    element option {
	      attribute value {$opt/@value/string()},$opt/string()}
	return $option
      }
    </select>
    {forms:pass-as-hidden-except($param)}
  </form>

  return $form
};

declare function forms:emit-checkbox-form(
  $id    as xs:string,
  $param as xs:string,
  $value as xs:string,
  $options as node()*)  as node()* 

{    

  let $form := 
   element form {
     attribute action {""},
     attribute id {$id},
     attribute style {"display:inline;float:right;"},
     element input {
	attribute type {"checkbox"},
        attribute name {$param},
        attribute value {$value},
	attribute onclick {"this.form.submit();return true;"},
	if($forms:anthologies=$value) then
	  attribute checked {"checked"}
	else
	  ()
      },
      $options[@value/string()=$value]/string(),
      forms:pass-as-hidden-except($param)
    }

  return $form
};

declare function forms:pass-as-hidden-except(
  $field as xs:string)  as node()* 
{
  let $inputs:=
  for $input in forms:pass-as-hidden()
  return
    if($input/@name ne $field) then
      $input
    else
      if($input/@name eq "page") then
	(<input name="page" type="hidden" value="1" />)
      else
	()
	    
  return $inputs
};

declare function forms:get-date($date as xs:string) as xs:string
{
  let $xsdate :=
      substring($date,1,4)

  return $xsdate
};
