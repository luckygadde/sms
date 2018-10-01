<%@ page import="com.grailstest.Book" %>
<%@ page import="com.grailstest.Student" %>
<html>
<head>
<title>Library Books</title>
    <meta name="layout" content="main">
</head>

<body>
<table id="librarytable" >
<div><h2 style="text-align: center;text-shadow: aqua;">Books Borrowed Report</h2></div>
    <g:if test="${library}">
        <thead>
        <th style="width: 100px;">Student Name</th>
        <th style="width: 100px">Student Stream</th>
        <th style="width: 100px">Book Title</th>
        <th style="width: 100px">Date</th>
        </thead>
    </g:if>
    <tbody>
    <g:each in="${library?.bookBorrowed.findAll{it.returned==false}}" >
        <tr>
            <td style="width: 100px">${it.student.firstName}</td>
            <td style="width: 100px">${it.student.stream.coursename}</td>
            <td style="width: 100px"> ${it.book.title} </td>
<%--            <td style="width: 100px"> ${format.format(it.borrowed)} </td>--%>
              <td style="width: 100px"><g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${it.borrowed}"/></td>
        </tr>
    </g:each>

    </tbody>

</table>
</body>
</html>