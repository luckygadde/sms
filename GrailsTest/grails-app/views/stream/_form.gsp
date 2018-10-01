<%@ page import="com.grailstest.Stream" %>



<div class="fieldcontain ${hasErrors(bean: streamInstance, field: 'coursename', 'error')} required">
	<label for="coursename">
		<g:message code="stream.coursename.label" default="Coursename" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="coursename" required="" value="${streamInstance?.coursename}"/>
</div>
<g:if test="${streamInstance?.lectures?.size()}">
<div class="fieldcontain ${hasErrors(bean: streamInstance, field: 'lectures', 'error')} ">
	<label for="lectures">
		<g:message code="stream.lectures.label" default="Lectures" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${streamInstance?.lectures?}" var="l">
    <li><g:link controller="lecture" action="show" id="${l.id}">${l?.firstName?.encodeAsHTML()}</g:link></li>
</g:each>
%{--
<li class="add">
<g:link controller="lecture" action="create" params="['stream.id': streamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'lecture.label', default: 'Lecture')])}</g:link>
</li>
--}%
</ul>

</div>
    </g:if>
<g:if test="${streamInstance?.subjects?.size()}">
<div class="fieldcontain ${hasErrors(bean: streamInstance, field: 'subjects', 'error')} ">
	<label for="subjects">
		<g:message code="stream.subjects.label" default="Subjects" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${streamInstance?.subjects}" var="s">
    <li><g:link controller="subject" action="show" id="${s.id}">${s?.name?.encodeAsHTML()}</g:link></li>
</g:each>
%{--
<li class="add">
<g:link controller="subject" action="create" params="['stream.id': streamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subject.label', default: 'Subject')])}</g:link>
</li>
--}%
</ul>

</div>
</g:if>

