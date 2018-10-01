<%@ page import="com.grailstest.Book" %>
<%@ page import="com.grailstest.Student" %>
<html>
<head>
<title>Library Books</title>
    <meta name="layout" content="main">
</head>
<body>
<g:form name="form" id="form " controller="home">
<h2 style="text-align: center;">Borrow Book</h2>
<table>
<tr id="student"  >
		
			<td>Student Name :</td>
             <td>
             <g:select name="student" from="${Student.list()}"
          noSelection="['':'-Choose Student-']"  optionKey="id" optionValue="firstName" />
             </td>
			</tr>
			<tr id="book"  >
		
			<td>Book  :</td>
             <td>
             <g:select name="book" from="${books}"
          noSelection="['':'-Choose Book-']" optionKey="id" optionValue="title" />
             </td>
			</tr>
			<tr>
			<td style="text-align: center; width: 100px" colspan="2"><g:actionSubmit value="Borrow" action="borrowBook"/></td>
			</tr>
</table>
</g:form>
</body>
</html>