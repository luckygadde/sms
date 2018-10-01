
<%@ page import="com.grailstest.Lecture" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lecture.label', default: 'Lecture')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-lecture" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
<%--				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
<%--				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%--%>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-lecture" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lecture">
			
				<g:if test="${lectureInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="lecture.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${lectureInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lectureInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="lecture.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${lectureInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lectureInstance?.dob}">
				<li class="fieldcontain">
					<span id="dob-label" class="property-label"><g:message code="lecture.dob.label" default="Dob" /></span>
					
						<span class="property-value" aria-labelledby="dob-label"><g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${lectureInstance?.dob}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lectureInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="lecture.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${lectureInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lectureInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="lecture.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${lectureInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lectureInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="lecture.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${lectureInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lectureInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="lecture.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${lectureInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${lectureInstance?.ltt}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="ltt-label" class="property-label"><g:message code="lecture.ltt.label" default="Ltt" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="ltt-label"><g:link controller="lectureTimeTable" action="show" id="${lectureInstance?.ltt?.id}">${lectureInstance?.ltt?.encodeAsHTML()}</g:link></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${lectureInstance?.staff}">
				<li class="fieldcontain">
					<span id="staff-label" class="property-label"><g:message code="lecture.staff.label" default="Staff" /></span>
					
						<span class="property-value" aria-labelledby="staff-label"><g:fieldValue bean="${lectureInstance}" field="staff"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lectureInstance?.stream}">
				<li class="fieldcontain">
					<span id="stream-label" class="property-label"><g:message code="lecture.stream.label" default="Streams" /></span>
					
						<span class="property-value" aria-labelledby="stream-label"><g:link controller="stream" action="show" id="${lectureInstance?.stream?.id}">${lectureInstance?.stream?.coursename?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${lectureInstance?.id}" />
					<g:link class="edit" action="edit" id="${lectureInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
