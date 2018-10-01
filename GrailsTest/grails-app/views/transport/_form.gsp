<%@ page import="com.grailstest.Transport" %>



<div class="fieldcontain ${hasErrors(bean: transportInstance, field: 'stopName', 'error')} required">
	<label for="stopName">
		<g:message code="transport.stopName.label" default="Stop Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="stopName" required="" value="${transportInstance?.stopName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transportInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="transport.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="student" from="${com.grailstest.Student.list()}" multiple="multiple"  required="" optionKey="id" optionValue="firstName" size="5" value="${transportInstance?.student*.id}" class="many-to-many"/>

</div>

