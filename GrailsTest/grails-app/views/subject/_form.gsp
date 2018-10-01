<%@ page import="com.grailstest.Subject" %>



<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="subject.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${subjectInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="subject.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
<%--	%{--<g:textField name="year" required="" value="${subjectInstance?.year}"/> --}%--%>
    <g:select name="year" from="['Fisrt Year', 'Second Year','Third Year','Fourth Year']"
              noSelection="['':'-Choose your year-']" />
</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'stream', 'error')} required">
	<label for="stream">
		<g:message code="subject.stream.label" default="Streams" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stream" name="stream.id" from="${com.grailstest.Stream.list()}" optionKey="id" optionValue="coursename" required="" value="${subjectInstance?.stream?.id}" class="many-to-one"/>
</div>

