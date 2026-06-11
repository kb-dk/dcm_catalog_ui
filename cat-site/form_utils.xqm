xquery version "1.0" encoding "UTF-8";

module namespace forms="http://kb.dk/this/formutils";

declare namespace  h="http://www.w3.org/1999/xhtml";
declare namespace request="http://exist-db.org/xquery/request";

declare variable $forms:notbefore := request:get-parameter("notbefore", "") cast as xs:string;
declare variable $forms:notafter  := request:get-parameter("notafter",  "") cast as xs:string;
declare variable $forms:query     := request:get-parameter("query",     "");
declare variable $forms:page      := request:get-parameter("page",      "1") cast as xs:integer;
declare variable $forms:number    := request:get-parameter("itemsPerPage","20") cast as xs:integer;
declare variable $forms:genre     := request:get-parameter("genre","") cast as xs:string;
declare variable $forms:title     := request:get-parameter("title", "") cast as xs:string;
declare variable $forms:name      := request:get-parameter("name", "") cast as xs:string;

declare variable $forms:scheme    := request:get-parameter("scheme","") cast as xs:string;
declare variable $forms:workno    := request:get-parameter("workno", "") cast as xs:string;

declare variable $forms:sortby    := request:get-parameter("sortby","null,work_number") cast as xs:string;
declare variable $forms:from      := ($forms:page - 1) * $forms:number + 1;
declare variable $forms:to        :=  $forms:from      + $forms:number - 1;
declare variable $forms:anthologies := request:get-parameter("anthologies","") cast as xs:string;


declare function forms:pass-as-hidden() as node()* {
  let $inputs :=
    (
    <h:input name="query"          type="hidden" value="{$forms:query}"  />,
    <h:input name="page"           type="hidden" value="{$forms:page}"   />,
    <h:input name="itemsPerPage"   type="hidden" value="{$forms:number}" />,
    <h:input name="genre"          type="hidden" value="{$forms:genre}" />,
    <h:input name="notbefore"      type="hidden" value="{$forms:notbefore}" />,
    <h:input name="notafter"       type="hidden" value="{$forms:notafter}" />,
    <h:input name="sortby"         type="hidden" value="{$forms:sortby}" />,
    <h:input name="anthologies"    type="hidden" value="{$forms:anthologies}" />,
    <h:input name="title"          type="hidden" value="{$forms:title}" />,
    <h:input name="name"           type="hidden" value="{$forms:name}" />,
    <h:input name="scheme"         type="hidden" value="{$forms:scheme}" />,
    <h:input name="workno"         type="hidden" value="{$forms:workno}" /> 
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
  <h:form action="" id="{$id}">
    <h:select name="{$param}" onchange="this.form.submit();return true;"> 
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
    </h:select>
    {forms:pass-as-hidden-except($param)}
  </h:form>

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
     element input {
	    attribute type {"checkbox"},
        attribute name {$param},
        attribute value {$value},
        attribute class {"checkbox"},
	    attribute onclick {"this.form.submit();return true;"},
	if($forms:anthologies=$value) then
	  attribute checked {"checked"}
	else
	  ()
      },
      element label {
        attribute for {$id},
        $options[@value/string()=$value]/string(),
        forms:pass-as-hidden-except($param)
      }
    }

  return $form
};

declare function forms:pass-as-hidden-except(
  $fields as xs:string)  as node()* 
{
  let $inputs:=
  for $input in forms:pass-as-hidden()
  return
    if( not(contains($fields, $input/@name)) ) then
      $input
    else
      if($input/@name eq "page") then
	(<h:input name="page" type="hidden" value="1" />)
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
