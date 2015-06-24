xquery version "1.0" encoding "UTF-8";

module  namespace  layout="http://kb.dk/this/app/layout";


declare function layout:head($title as xs:string,
                             $additions as node()*
			) as node() 
{
  let $head :=
  <head>
    <title>{$title}</title>
      
    <meta http-equiv="Content-Type" content="application/xhtml+xml;charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    
    <link rel="icon" type="image/vnd.microsoft.icon" href="/storage/favicon.ico" />
      
    <link type="text/css" href="/editor/style/dcm.css" rel="stylesheet" />
    <link type="text/css" href="/editor/style/cnw.css" rel="stylesheet" />
    {$additions}

    <link href="/editor/jquery/jquery-ui-1.10.3/css/base/jquery-ui.css" 
       rel="stylesheet" 
       type="text/css"/>

    <link href="/editor/jquery/jquery-ui-1.10.3/css/style.css" 
       rel="stylesheet"  
       type="text/css"/>
      
    <script type="text/javascript" src="/editor/js/confirm.js">
      //
    </script>
      
    <script type="text/javascript" src="/editor/js/checkbox.js">
      //
    </script>
      
    <script type="text/javascript" src="/editor/js/publishing.js">
      //
    </script>

    <script type="text/javascript" src="/editor/jquery/jquery-ui-1.10.3/js/jquery-1.9.1.js">
      //
    </script>

    <script type="text/javascript" src="/editor/jquery/jquery-ui-1.10.3/js/jquery-ui-1.10.3.custom.js">
      //
    </script>
    <script type="text/javascript" src="/editor/jquery/jquery-ui-1.10.3/slider.js">
      //
    </script>

  </head>

  return $head

};

declare function layout:page-head(
                        $title as xs:string,
			$subtitle as xs:string) as node()
{
  let $header :=
  <div id="header">
    <div class="kb_logo">
      <a href="http://www.kb.dk" title="Det Kongelige Bibliotek"><img
         id="KBLogo"
	 title="Det Kongelige Bibliotek" 
	 alt="KB Logo" src="/editor/images/kb_white.png"/><img
	 id="KBLogo_print"
	 title="Det Kongelige Bibliotek" 
	 alt="KB Logo" src="/editor/images/kb.png"/></a>
    </div>
    <h1>{$title}</h1>
    <h2>{$subtitle}</h2>
  </div>

  return $header

};

declare function layout:page-menu($mode as xs:string) as node()
{
  let $menu := 
  <div id="menu" class="noprint">
    { 
    let $preface:= if ($mode="preface") then "selected" else ""
    return (<a href="preface.xq" class="{$preface}">Preface</a>)
    } 
    { 
    let $introduction:= if ($mode="introduction") then "selected" else ""
    return (<a href="introduction.xq" class="{$introduction}">Introduction</a>)
    } 
    { 
    let $browse:= if ($mode="") then "selected" else ""
    return (<a href="navigation.xq" class="{$browse}">Catalogue</a>)
    }
    { 
    let $appendix:= if ($mode="appendix") then "selected" else ""
    return (<a href="appendix.xq" class="{$appendix}">Appendix</a>)
    } 
    { 
    let $about:= if ($mode="about") then "selected" else ""
    return (<a href="about.xq" class="{$about}">About CNW</a>)
    } 
  </div> 

  return $menu

};


declare function layout:page-footer($mode as xs:string) as node()
{
  let $footer :=
  <div id="footer" style="text-align: center; height: auto; padding: 10px 20px;">
    <a href="http://www.kb.dk/dcm" title="DCM" 
    style="text-decoration:none;"><img 
    style="border: 0px; vertical-align:middle;" 
    alt="DCM Logo" 
    src="/editor/images/dcm_logo_small_white.png"
    id="dcm_logo"/><img 
    style="border: 0px; vertical-align:middle;" 
    alt="DCM Logo" 
    src="/editor/images/dcm_logo_small.png"
    id="dcm_logo_print"
    /></a>
    2014 Danish Centre for Music Publication | The Royal Library | P.O. Box 2149 | Copenhagen K, Denmark | <a name="www.kb.dk" id="www.kb.dk" href="http://www.kb.dk/dcm">www.kb.dk/dcm</a><br/> 
  <span class="creativecommons" style="font-size: .65em;">
            <!--<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/"
            title="Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported License"><img 
            alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-nd/3.0/80x15.png" /></a><br/>-->
		    This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/">Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported License</a>
  </span>
  </div>

  return $footer

};

