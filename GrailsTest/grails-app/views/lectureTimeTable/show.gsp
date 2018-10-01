
<%@ page import="com.grailstest.LectureTimeTable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lectureTimeTable.label', default: 'LectureTimeTable')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-lectureTimeTable" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
<%--%{----%>
<%--				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
<%--				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--%>
<%----}%--%>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-lectureTimeTable" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lectureTimeTable">
			
				<g:if test="${lectureTimeTableInstance?.lecture}">
				<li class="fieldcontain">
					<span id="lecture-label" class="property-label"><g:message code="lectureTimeTable.lecture.label" default="Lecture" /></span>
					
						<span class="property-value" aria-labelledby="lecture-label"><g:link controller="lecture" action="show" id="${lectureTimeTableInstance?.lecture?.id}">${lectureTimeTableInstance?.lecture?.firstName.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${lectureTimeTableInstance?.stream}">
				<li class="fieldcontain">
					<span id="stream-label" class="property-label"><g:message code="lectureTimeTable.stream.label" default="Stream" /></span>
					
						<span class="property-value" aria-labelledby="stream-label"><g:link controller="stream" action="show" id="${lectureTimeTableInstance?.stream?.id}">${lectureTimeTableInstance?.stream?.coursename?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${lectureTimeTableInstance?.subject}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="lectureTimeTable.subject.label" default="Subject" /></span>
					
						<span class="property-value" aria-labelledby="subject-label"><g:link controller="subject" action="show" id="${lectureTimeTableInstance?.subject?.id}">${lectureTimeTableInstance?.subject?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${lectureTimeTableInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="lectureTimeTable.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${lectureTimeTableInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lectureTimeTableInstance?.peroid}">
				<li class="fieldcontain">
					<span id="peroid-label" class="property-label"><g:message code="lectureTimeTable.peroid.label" default="Peroid" /></span>
					
						<span class="property-value" aria-labelledby="peroid-label"><g:fieldValue bean="${lectureTimeTableInstance}" field="peroid"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${lectureTimeTableInstance?.id}" />
					<g:link class="edit" action="edit" id="${lectureTimeTableInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
