<%@ page import="com.grailstest.Book" %>
<%@ page import="com.grailstest.Student" %>
<%@ page import="com.grailstest.BookBorrowed" %>
<html>
<head>
<title>Library Books</title>
    <meta name="layout" content="main">
   
    <script type="text/javascript">
function loadbooks(value) {
    <g:remoteFunction controller="home" action="loadbooks"
        update="bookid" onLoading="loading()"  onSuccess="done()"
        params="'studtid='+value"/>
}
function loading(){
    $("#wait").css("display", "block");
}
function done(){
    $("#wait").css("display", "none");
}
</script>
</head>

<body>
<g:form name="form" id="form " controller="home">
<h2 style="text-align: center;">Return Book</h2>
<table>
<tr id="student"  >
		
			<td>Student Name :</td>
             <td>
             <g:select name="student" from="${booksBorrowed.student.unique()}"
          noSelection="['':'-Choose Student-']"  optionKey="id" optionValue="firstName" onchange="loadbooks(this.value)" />
             </td>
            
			</tr>
			<tr>
			<td id="wait" style="display:none;width:69px;height:89px;border:0px;position:absolute;top:60%;left:70%;padding:2px;"><img src='${resource(dir: 'images', file: 'loading_spinner.gif')}' width="64" height="64" /><br></td>     
			
			</tr>
			<tr id="book"  >
		
			<td>Book  :</td>
             <td>
             %{--<g:select name="book" id="bookid" from="${}"--}%
              />
             </td>
			</tr>
			<tr>
			<td style="text-align: center; width: 100px" colspan="2"><g:actionSubmit value="Return" action="returnBook"/></td>
			</tr>
</table>
</g:form>
</body>
</html>