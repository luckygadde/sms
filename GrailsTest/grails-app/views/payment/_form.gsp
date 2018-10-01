<%@ page import="com.grailstest.Payment" %>



<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="payment.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="amount" value="${fieldValue(bean: paymentInstance, field: 'amount')}" required="" />

</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="payment.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="studentid" from="${com.grailstest.Student.list()}" optionKey="id" optionValue="firstName"  required="" value="${paymentInstance?.student?.id}" class="many-to-one"/>

</div>

