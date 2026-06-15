xquery version "1.0" encoding "UTF-8";

module  namespace  layout="http://kb.dk/this/app/layout";
declare namespace  h="http://www.w3.org/1999/xhtml";
declare namespace  m="http://www.music-encoding.org/ns/mei";

declare variable $layout:coll     := request:get-parameter("c","") cast as xs:string;

declare function layout:head($title as xs:string,
                             $additions as node()*,
                             $verovio as xs:boolean
			) as node() 
{
  let $head :=
  <h:head>
    <h:title>{$title}</h:title>
      
    <h:meta http-equiv="Content-Type" content="application/xhtml+xml;charset=UTF-8" />
    <h:meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    
    <h:link rel="icon" type="image/vnd.microsoft.icon" href="favicon.ico" />
      
    <h:link type="text/css" 
          href="style/dcm.css" 
	  rel="stylesheet" />

   {$additions}

    <h:link type="text/css" 
          href="style/{$layout:coll}/collection.css" 
	  rel="stylesheet" />

    <h:link href="jquery/jquery-ui-1.10.3/css/base/jquery-ui.css" 
       rel="stylesheet" 
       type="text/css"/>

    <h:link href="jquery/jquery-ui-1.10.3/css/style.css" 
       rel="stylesheet"  
       type="text/css"/>
      
    <h:script type="text/javascript" src="js/swap_num_type.js">
      //
    </h:script>

    <h:script type="text/javascript" src="js/filter.js">
      //
    </h:script>
      
    <h:script type="text/javascript" src="jquery/jquery-ui-1.10.3/js/jquery-1.9.1.js">
      //
    </h:script>

    <h:script type="text/javascript" src="jquery/jquery-ui-1.10.3/js/jquery-ui-1.10.3.custom.js">
      //
    </h:script>
    
    <!-- insert slider.js script here to activate the year slider -->
    
    { if($verovio) then   
			<h:script src="http://www.verovio.org/javascript/latest/verovio-toolkit-light.js" type="text/javascript">
			//
			</h:script>
    else () }
    
    { if($verovio) then   
			<h:script type="text/javascript">
				/* Create the Verovio toolkit instance */
				var vrvToolkit = new verovio.toolkit();
			</h:script>
    else () }
    
    
  </h:head>

  return $head

};

declare function layout:page-head-doc($html as node()) as node()
{
	let $div :=
		for $t in $html//h:title
			let $tit := 
				if($t/@id) then
					$t/@id
				else
					""
			let $sub :=
				if($t/text()) then
					$t/text()
				else
					""
			return 
				layout:page-head($tit,$sub)

		return $div
};

declare function layout:page-head(
                        $title as xs:string,
			$subtitle as xs:string) as node()
{
  let $header :=
  <h:div id="header">
    <h:div class="kb_logo">
      <h:a href="http://www.kb.dk" title="Det Kgl. Bibliotek"><h:img
         id="KBLogo"
	 title="Det Kgl. Bibliotek" 
	 alt="Logo of the Royal Danish Library. Click to go to the library's web site" src="style/images/kb_white.png"/><h:img
	 id="KBLogo_print"
	 title="Det Kgl. Bibliotek" 
	 alt="Logo of the Royal Danish Library. Click to go to the library's web site" src="style/images/kb.png"
	 /></h:a>
    </h:div>
    <h:h1>
    <h:a style="text-decoration:none;" 
       href="http://www.kb.dk/dcm/{$layout:coll}.html" 
       title="{$title} – {$subtitle}">{$title}</h:a></h:h1>
    <h:h2><h:a style="text-decoration:none;" href="http://www.kb.dk/dcm/{$layout:coll}.html" title="{$title} – {$subtitle}">{$subtitle}</h:a></h:h2>
  </h:div>

  return $header

};

declare function layout:page-menu($mode as xs:string) as node()
{

  let $menudoc  :=
  <h:div id="menu" class="noprint"> {
  for $anchor in doc(concat("/db/cat-site/",$layout:coll,"/menu.html"))/div/a
    return 
      if(contains($anchor/@href,$mode)) then
	<h:a href="{$anchor/@href}" class="selected">{$anchor/text()}</h:a>
      else
	<h:a href="{$anchor/@href}" class="">{$anchor/text()}</h:a>
  } </h:div>
  return $menudoc

};


declare function layout:page-footer($mode as xs:string) as node()
{
  let $footer :=
  <h:div id="footer">
    <h:p>2014–2018 Danish Centre for Music Editing | Royal Danish Library | Copenhagen, Denmark | <h:a name="www.kb.dk" id="www.kb.dk" href="http://www.kb.dk/">www.kb.dk/en/</h:a></h:p>
  </h:div>

  return $footer

};

