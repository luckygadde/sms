<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.grailstest.Stream" %>
<%@ page import="com.grailstest.Subject" %>
<%@ page import="com.grailstest.Lecture" %>

<%@ page import="com.grailstest.LectureTimeTable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lectureTimeTable.label', default: 'LectureTimeTable')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript">
            function loadsubjects(value) {

            <g:remoteFunction controller="home" action="loadsubject"
        update="subjctid" onLoading="loading()"  onSuccess="done()"
        params="'stremid='+value"/>
            }
            function loading(){
                $("#wait").css("display", "block");
            }
            function done(){
                $("#wait").css("display", "none");
            }

            
        </script>


    </head>
	<body>
		<a href="#create-lectureTimeTable" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
<%--				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%--%>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-lectureTimeTable" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${lectureTimeTableInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${lectureTimeTableInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
