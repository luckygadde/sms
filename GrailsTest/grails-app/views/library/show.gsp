
<%@ page import="com.grailstest.Library" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'library.label', default: 'Library')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-library" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-library" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list library">
			
				<g:if test="${libraryInstance?.booksCount}">
				<li class="fieldcontain">
					<span id="booksCount-label" class="property-label"><g:message code="library.booksCount.label" default="Books Count" /></span>
					
						<span class="property-value" aria-labelledby="booksCount-label"><g:fieldValue bean="${libraryInstance}" field="booksCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${libraryInstance?.book}">
				<li class="fieldcontain">
					<span id="book-label" class="property-label"><g:message code="library.book.label" default="Book" /></span>
					
						<g:each in="${libraryInstance.book}" var="b">
						<span class="property-value" aria-labelledby="book-label"><g:link controller="book" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${libraryInstance?.signUpDate}">
				<li class="fieldcontain">
					<span id="signUpDate-label" class="property-label"><g:message code="library.signUpDate.label" default="Sign Up Date" /></span>
					
						<span class="property-value" aria-labelledby="signUpDate-label"><g:formatDate date="${libraryInstance?.signUpDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${libraryInstance?.students}">
				<li class="fieldcontain">
					<span id="students-label" class="property-label"><g:message code="library.students.label" default="Students" /></span>
					
						<g:each in="${libraryInstance.students}" var="s">
						<span class="property-value" aria-labelledby="students-label"><g:link controller="student" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${libraryInstance?.id}" />
					<g:link class="edit" action="edit" id="${libraryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
