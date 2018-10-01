<html>
<head>
<title>College Details</title>
    <meta name="layout" content="main">

</head>
<body>
<%--<h2 style="text-align: center;text-shadow: aqua;">Details Report</h2>--%>


<%--<g:form controller="home" action="search">--%>
<%--<input type="text" id="search" value="" />--%>
<%--<g:submitButton name="searchsub" value="submit" type="actionSubmit"/>--%>
<%--</g:form>--%>
<g:if test="${flash.message}">
  <div class="message" style="display: block;color: red;">${flash.message}</div>
</g:if>

<table   id="studenttable">
<g:if test="${result1}">
<thead>
<th style="width: 100px">Student Name</th>
<th style="width: 100px">Study Year</th>
<th style="width: 100px">Stream</th>
<%--%{--<th style="width: 100px">Action</th>--}%--%>
</thead>
</g:if>
<tbody>
<g:each in="${result1}" > 
     <tr>
     <td style="width: 100px">${it.firstName} ${it.lastName}</td>
     <td style="width: 100px"> ${it.studyyear} </td>
     <td style="width: 100px"> ${it.stream.coursename} </td>
<%--%{--<td style="text-align: center; width: 100px" colspan=""><g:link controller="home"  params="${[studentid : it.id]}" value="Remove" action="deleteStudentDetails">Remove</g:link></td>--}%--%>
</tr>
</g:each>

</tbody>

</table>

<table   id="lecturetable">
<g:if test="${result2}">
<thead>
<th style="width: 100px">Lecture Name</th>
<th style="width: 100px">Stream</th>
<th style="width: 100px">Action</th>
</thead>
</g:if>
<tbody>

<g:each in="${result2}" > 
     <tr>
     <td style="width: 100px">${it.firstName}  ${it.lastName}</td>
     <td style="width: 100px"> ${it.stream.coursename} </td>
<td style="text-align: center; width: 100px" colspan=""><g:link controller="home"  params="${[lectureid : it.id]}" value="Remove" action="deleteLectureDetails">Remove</g:link></td>
</tr>
</g:each>

</tbody>

</table>

<table   id="stafftable" style="width: 960px" >

<g:if test="${result3}">
<div><h2 style="text-align: center;text-shadow: aqua;">Staff Report</h2></div>
<thead>
<th style="width: 100px"> Name</th>
<th style="width: 100px"> Profession</th>
<%--%{--<th style="width: 100px">Action</th>--}%--%>
</thead>
</g:if>
<tbody>

<g:each in="${result3}" > 
     <tr>
     <td style="width: 100px">${it.firstName}  ${it.lastName}</td>
     <td style="width: 100px">${it.staff}</td>
<%--%{--<td style="text-align: center; width: 100px" colspan=""><g:link controller="home"  params="${[staffid : it.id]}" value="Remove" action="deleteStaffDetails">Remove</g:link></td>--}%--%>
</tr>
</g:each>

</tbody>

</table>

<table   id="booktable"  >

<g:if test="${bookresult}">
<h2 style="text-align: center;text-shadow: aqua;">Books Report</h2>
<thead>
<th style="width: 100px">Book Title</th>
<th style="width: 100px">Author Name</th>
<th style="width: 100px">Book Count</th>
</thead>
</g:if>
<tbody>
<g:each in="${bookresult}" > 
     <tr>
     <td style="width: 100px"><g:link controller="book" action="show" id="${it.id}">${it.title}</g:link></td>
     <td style="width: 100px"> ${it.authorName} </td>
     <td style="width: 100px"> ${it.copies} </td>
</tr>
</g:each>

</tbody>

</table>





<table   id="lecturetimetable">
<g:if test="${lecturett}">
<thead>
<th style="width: 100px">Lecture Name</th>
<th style="width: 100px">Stream</th>
<th style="width: 100px"> Year</th>
<th style="width: 100px">Subject</th>
<th style="width: 100px">Peroid</th>
<th style="width: 100px">Action</th>
</thead>
</g:if>
<tbody>
<g:each in="${lecturett}" > 
     <tr>
     <td style="width: 100px">${it.lecture.firstName}</td>
     <td style="width: 100px"> ${it.stream.coursename} </td>
     <td style="width: 100px"> ${it.year} </td>
     <td style="width: 100px"> ${it.subjects.name} </td>
      <td style="width: 100px"> ${it.peroid} </td>
<td style="text-align: center; width: 100px" colspan=""><g:link controller="home"  params="${[lecturett : it.id]}" value="Remove" action="deletelecturetimetable">Remove</g:link></td>
</tr>
</g:each>

</tbody>

</table>

</body>

</html>