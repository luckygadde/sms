<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $( function() {
            $( "#datepicker" ).datepicker();
        } );
        </script>
                <g:layoutHead/>
    <r:layoutResources/>
        <style>


</style>
</head>

<body>
<div id="grailsLogo" role="banner"><a href="http://grails.org"><img
      src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails" width="100" height="100"/></a></div>
<div id="grailsLogo" role="banner" style="background-color:	#ADD8E6;"  ><img
        src="${resource(dir: 'images', file: 'cgs_logo.jpg')}" alt="SMS"/></div>
<table>
<tr>
<td style="text-align: center; width: 100px" colspan="3"><g:link controller="home" action="getregister">Register</g:link></td>--%>
<td style="text-align: center; width: 100px" colspan="3"><g:link controller="home" action="home">Home</g:link></td>--%>
</tr>
</table>
 
<g:layoutBody/>
<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
<g:message code="spinner.alt" default="Loading&hellip;"/>
</div>
<g:javascript library="application"/>
<r:layoutResources/>

</body>
</html>
