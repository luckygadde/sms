
<%@ page import="com.grailstest.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="studentmain">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<%--		<div class="nav" role="navigation">--%>
<%--			<ul>--%>
<%--				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%--%>
<%--				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--%>
<%--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
<%--			</ul>--%>
<%--		</div>--%>

		<div id="show-student" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list student">
			
				<g:if test="${studentInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="student.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${studentInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="student.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${studentInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.dob}">
				<li class="fieldcontain">
					<span id="dob-label" class="property-label"><g:message code="student.dob.label" default="Dob" /></span>
					
						<span class="property-value" aria-labelledby="dob-label"><g:formatDate format="yyyy-MM-dd" date="${studentInstance?.dob}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="student.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${studentInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="student.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${studentInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="student.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${studentInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="student.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${studentInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="student.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${studentInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.studyyear}">
				<li class="fieldcontain">
					<span id="studyyear-label" class="property-label"><g:message code="student.studyyear.label" default="Studyyear" /></span>
					
						<span class="property-value" aria-labelledby="studyyear-label"><g:fieldValue bean="${studentInstance}" field="studyyear"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.stream}">
				<li class="fieldcontain">
					<span id="stream-label" class="property-label"><g:message code="student.stream.label" default="Streams" /></span>
					
						<span class="property-value" aria-labelledby="stream-label"><g:link controller="stream" action="showsingle" id="${studentInstance?.stream?.id}">${studentInstance?.stream?.coursename.encodeAsHTML()}</g:link></span>
<%--					<span class="property-value" aria-labelledby="stream-label"><g:link controller="stream" action="gettimetable" id="${studentInstance?.stream?.id}">${studentInstance?.stream?.coursename.encodeAsHTML()}</g:link></span>--%>
				</li>
				</g:if>
				
				<g:if test="${studentInstance?.transportfacility}">
				<li class="fieldcontain">
					<span id="transportfacility-label" class="property-label"><g:message code="student.transport.label" default="Transport" /></span>
					
						<span class="property-value" aria-labelledby="transportfacility-label"><g:fieldValue bean="${studentInstance}" field="transportfacility"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${studentInstance?.fee}">
				<li class="fieldcontain">
					<span id="fee-label" class="property-label"><g:message code="student.payment.label" default="Payment" /></span>
					
						<span class="property-value" aria-labelledby="fee"><g:fieldValue bean="${studentInstance}" field="fee"/></span>
					
				</li>
				</g:if>
			
			</ol>
<%--			<g:form>--%>
<%--				<fieldset class="buttons">--%>
<%--					<g:hiddenField name="id" value="${studentInstance?.id}" />--%>
<%--					<g:link class="edit" action="edit" id="${studentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--%>
<%--					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
<%--				</fieldset>--%>
<%--			</g:form>--%>
		</div>
	</body>
</html>
