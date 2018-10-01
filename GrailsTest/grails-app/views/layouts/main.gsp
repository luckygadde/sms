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
table, th, tr,td {
    border: 1px solid black;
    text-align: center;
    width: 960px
}

</style>
<style >
 a:link, a:visited, a:hover {
	color: #0000FF;
 }
 h1 {
    color: #000000;
    font-weight: normal;
    font-size: 1.25em;
    margin: 0.8em 0 0.3em 0;
}
a:hover {
    background-color: white;
}
</style>
<style style="text/css">
  	.tablestyle{
		width:100%;
		border-collapse:collapse;
	}
</style>
</head>
<%--
<body style="background-color:#FFFFFF;" >
<div id="grailsLogo" role="banner" style="background-color:	#ADD8E6;" ><img
        src="${resource(dir: 'images', file: 'cgs_logo.jpg')}" alt="SMS" />
       </div>
         <div style="text-align: right;"><g:link controller="home" action="index" > Logout</g:link>
         <h1  style="text-align: center; color: black">Welcome to College Portal </h1>
        </div>


<table  class="tablestyle" style="width: 100%;height: 100px;" >
   <tr>
        <td style="text-align: center; width: 100px;color: black;" colspan="3"><g:link controller="home" action="home1">Home</g:link></td>
        <td style="text-align: center; width: 100px" colspan="3"><g:link controller="home" action="borrowedbooks">Books Borrowed</g:link></td>
        <td style="text-align: center; width: 100px" colspan="3"><g:link controller="lectureTimeTable" action="create">Add Time Table</g:link></td>
<   </tr>
    <tr>
 <td style="text-align: center; width: 100px" colspan="3"><g:link controller="home" action="getStudentDetails">Students</g:link></td>
        <td style="text-align: center; width: 100px" colspan="3"><g:link controller="student" action="list">Students</g:link></td>
        <td style="text-align: center; width: 100px" colspan="3"><g:link controller="lecture" action="list">Lecturers </g:link></td>
        <td style="text-align: center; width: 100px" colspan="3"><g:link controller="home" action="getStaffDetails">Staff</g:link></td>
    </tr>
    <tr>
       <td style="text-align: center; width: 100px" colspan="3"><g:link controller="home" action="goToBookPage">Add Books</g:link></td>--}%--
       <td style="text-align: center; width: 100px" colspan="3"><g:link class="create" controller="book" action="create">Add Books</g:link></td>--}%
      <td style="text-align: center; width: 100px" colspan="3"><g:link controller="home" action="getBookDetails">Books in Library</g:link></td>--}%
        <td style="text-align: center; width: 100px" colspan="3"><g:link controller="home" action="gotoLibrary">Borrow book from Librarian</g:link></td>--}%
    </tr>
    <tr>
        <td style="text-align: center; width: 100px" colspan="3"><g:link controller="stream" action="list">Courses Offered </g:link></td>--}%
       <td style="text-align: center; width: 100px" colspan="3"><g:link controller="subject" action="create">Add Subject </g:link></td>--}%
         <td style="text-align: center; width: 100px" colspan="3"><g:link controller="home" action="returnBooktoLibrary">Return Book To Librarian </g:link></td>--}%

    </tr>
    <tr>
            <td style="text-align: center; width: 100px" colspan="3"><g:link controller="transport" action="create">Add Transport </g:link></td>--}
               <td style="text-align: center; width: 100px" colspan="3"><g:link controller="transport" action="list"> Transport List </g:link></td>--}%
                <td style="text-align: center; width: 100px" colspan="3"><g:link controller="payment" action="create"> Student Fee-Payment </g:link></td>--%>
    </tr>
</table>
<g:layoutBody/>
<div class="footer" role="contentinfo"></div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<g:javascript library="application"/>
<r:layoutResources/>
</body>
</html>
