
<%@ page import="com.grailstest.Lecture" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lecture.label', default: 'Lecture')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-lecture" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
<%--				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-lecture" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table style="width: 960px">
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'lecture.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'lecture.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="stream" title="stream" />
					
						<g:sortableColumn property="gender" title="${message(code: 'lecture.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="TimeTable" title="TimeTable" />
					
						<g:sortableColumn property="email" title="${message(code: 'lecture.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${lectureInstanceList}" status="i" var="lectureInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${lectureInstance.id}">${fieldValue(bean: lectureInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: lectureInstance, field: "lastName")}</td>
					
						<td>${lectureInstance?.stream?.coursename}</td>
					
						<td>${fieldValue(bean: lectureInstance, field: "gender")}</td>
					
						<td><g:link controller="lectureTimeTable" action="showTimeTable" id="${lectureInstance.id}">Click To see time table </g:link></td>
					
						<td>${fieldValue(bean: lectureInstance, field: "email")}</td>
					
					</tr>

				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${lectureInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
