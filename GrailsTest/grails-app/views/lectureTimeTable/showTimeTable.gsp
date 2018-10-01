
<%@ page import="com.grailstest.LectureTimeTable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lectureTimeTable.label', default: 'LectureTimeTable')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-lectureTimeTable" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
<%--				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%--%>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-lectureTimeTable" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
<%--			<table>--%>
<%--				<thead>--%>
<%--					<tr>--%>
<%--					--%>
<%--						<th><g:message code="lectureTimeTable.lecture.label" default="Lecture" /></th>--%>
<%--					--%>
<%--						<th><g:message code="lectureTimeTable.stream.label" default="Stream" /></th>--%>
<%--					--%>
<%--						<th><g:message code="lectureTimeTable.subject.label" default="Subject" /></th>--%>
<%--					--%>
<%--						<g:sortableColumn property="year" title="${message(code: 'lectureTimeTable.year.label', default: 'Year')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="peroid" title="${message(code: 'lectureTimeTable.peroid.label', default: 'Peroid')}" />--%>
<%--					--%>
<%--					</tr>--%>
<%--				</thead>--%>
<%--				<tbody>--%>
<%--				<g:each in="${lectureTimeTableInstanceList}" status="i" var="lectureTimeTableInstance">--%>
<%--					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--%>
<%--					--%>
<%--						<td><g:link action="show" id="${lectureTimeTableInstance.id}">${fieldValue(bean: lectureTimeTableInstance, field: "lecture.firstName")}</g:link></td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: lectureTimeTableInstance, field: "stream.coursename")}</td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: lectureTimeTableInstance, field: "subject.name")}</td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: lectureTimeTableInstance, field: "year")}</td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: lectureTimeTableInstance, field: "peroid")}</td>--%>
<%--					--%>
<%--					</tr>--%>
<%--				</g:each>--%>
<%--				</tbody>--%>
<%--			</table>--%>
			<table>
 
    <tr>
        <th>Days/Peroids</th>
        <th>FirstPeroid</th>
        <th>SecondPeroid</th>
        <th>ThirdPeroid</th>
        <th>FourthPeroid</th>
        <th>FifthPeroid</th>
        
    </tr>


    <tr>
      <th>Monday</th>
      
    <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='1' && it.peroid=='Fisrt period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='1' && it.peroid=='Fisrt period'}}" var="ltt">
     
         <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
        
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

            <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='1' && it.peroid=='Second period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='1' && it.peroid=='Second period'}}" var="ltt">
     
        <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g> <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='1' && it.peroid=='Third period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='1' && it.peroid=='Third period'}}" var="ltt">
     
        <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='1' && it.peroid=='Fourth period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='1' && it.peroid=='Fourth period'}}" var="ltt">
     
      <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g> <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
   <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
     
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='1' && it.peroid=='Fifth period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='1' && it.peroid=='Fifth period'}}" var="ltt">
     
       <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
     <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
    </tr>

    <tr>
       <th>Tuesday</th>
        
                <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='2' && it.peroid=='Fisrt period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='2' && it.peroid=='Fisrt period'}}" var="ltt">
     
         <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g> <br> ${ltt?.year } </td>
        
          </g:each>
      </g:if>
      <g:else>
     <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

            <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='2' && it.peroid=='Second period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='2' && it.peroid=='Second period'}}" var="ltt">
     
        <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='2' && it.peroid=='Third period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='2' && it.peroid=='Third period'}}" var="ltt">
     
        <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='2' && it.peroid=='Fourth period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='2' && it.peroid=='Fourth period'}}" var="ltt">
     
         <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
     
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='2' && it.peroid=='Fifth period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='2' && it.peroid=='Fifth period'}}" var="ltt">
     
       <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
    </tr>

    <tr>
        
         <th>Wednesday</th>
          
            <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='3' && it.peroid=='Fisrt period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='3' && it.peroid=='Fisrt period'}}" var="ltt">
     
         <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
        
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

            <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='3' && it.peroid=='Second period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='3' && it.peroid=='Second period'}}" var="ltt">
     
         <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='3' && it.peroid=='Third period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='3' && it.peroid=='Third period'}}" var="ltt">
     
      <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='3' && it.peroid=='Fourth period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='3' && it.peroid=='Fourth period'}}" var="ltt">
     
      <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
     
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='3' && it.peroid=='Fifth period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='3' && it.peroid=='Fifth period'}}" var="ltt">
     
        <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

    </tr>

<tr>
        
         <th>Thursday</th>
          
            <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='4' && it.peroid=='Fisrt period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='4' && it.peroid=='Fisrt period'}}" var="ltt">
     
         <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
        
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

            <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='4' && it.peroid=='Second period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='4' && it.peroid=='Second period'}}" var="ltt">
     
       <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
     <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='4' && it.peroid=='Third period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='4' && it.peroid=='Third period'}}" var="ltt">
     
       <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='4' && it.peroid=='Fourth period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='4' && it.peroid=='Fourth period'}}" var="ltt">
     <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
     
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='4' && it.peroid=='Fifth period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='4' && it.peroid=='Fifth period'}}" var="ltt">
     
         <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

    </tr>


    <tr>
        <th>Friday</th>
        
                   <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='5' && it.peroid=='Fisrt period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='5' && it.peroid=='Fisrt period'}}" var="ltt">
     
         <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
        
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

            <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='5' && it.peroid=='Second period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='5' && it.peroid=='Second period'}}" var="ltt">
     
         <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='5' && it.peroid=='Third period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='5' && it.peroid=='Third period'}}" var="ltt">
     
         <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
     <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='5' && it.peroid=='Fourth period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='5' && it.peroid=='Fourth period'}}" var="ltt">
     
         <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
     
      <g:if test="${lectureTimeTableInstanceList.findAll{it.day=='5' && it.peroid=='Fifth period'}}">
   
    <g:each in="${lectureTimeTableInstanceList.findAll{it.day=='5' && it.peroid=='Fifth period'}}" var="ltt">
     
        <td> ${ltt?.subject?.name } <br> <g style="color:green;">${ltt?.stream?.coursename }</g>  <br> ${ltt?.year } </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
    </tr>
</table>
		
			
			
			
			<div class="pagination">
				<g:paginate total="${lectureTimeTableInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
