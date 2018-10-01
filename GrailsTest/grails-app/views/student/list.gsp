
<%@ page import="com.grailstest.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
<%--				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%--%>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-student" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'student.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'student.lastName.label', default: 'Last Name')}" />
					
<%--						<g:sortableColumn property="dob" title="${message(code: 'student.dob.label', default: 'Dob')}" />--%>
					
						<g:sortableColumn property="gender" title="${message(code: 'student.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'student.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'student.email.label', default: 'Email')}" />
                       
                       <g:sortableColumn property="transportfacility" title="${message(code: 'student.transport.label', default: 'Transport')}" />

                        <g:sortableColumn property="fee" title="${message(code: 'student.payment.label', default: 'Payment')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${studentInstanceList}" status="i" var="studentInstance">
				
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${studentInstance.id}">${fieldValue(bean: studentInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: studentInstance, field: "lastName")}</td>
					
<%--						<td><g:formatDate format="yyyy-MM-dd" date="${studentInstance.dob}" /></td>--%>
					
						<td>${fieldValue(bean: studentInstance, field: "gender")}</td>
					
						<td>${fieldValue(bean: studentInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: studentInstance, field: "email")}</td>
						
						<td>${fieldValue(bean: studentInstance, field: "transportfacility")}</td>
						
						<td>${fieldValue(bean: studentInstance, field: "fee")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${studentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
