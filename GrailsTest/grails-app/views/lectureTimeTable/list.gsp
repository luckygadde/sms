
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
<%--				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-lectureTimeTable" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="lectureTimeTable.lecture.label" default="Lecture" /></th>
					
						<th><g:message code="lectureTimeTable.stream.label" default="Stream" /></th>
					
						<th><g:message code="lectureTimeTable.subject.label" default="Subject" /></th>
					
						<g:sortableColumn property="year" title="${message(code: 'lectureTimeTable.year.label', default: 'Year')}" />
					
						<g:sortableColumn property="peroid" title="${message(code: 'lectureTimeTable.peroid.label', default: 'Peroid')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${lectureTimeTableInstanceList}" status="i" var="lectureTimeTableInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${lectureTimeTableInstance.id}">${fieldValue(bean: lectureTimeTableInstance, field: "lecture.firstName")}</g:link></td>
					
						<td>${fieldValue(bean: lectureTimeTableInstance, field: "stream.coursename")}</td>
					
						<td>${fieldValue(bean: lectureTimeTableInstance, field: "subject.name")}</td>
					
						<td>${fieldValue(bean: lectureTimeTableInstance, field: "year")}</td>
					
						<td>${fieldValue(bean: lectureTimeTableInstance, field: "peroid")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${lectureTimeTableInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
