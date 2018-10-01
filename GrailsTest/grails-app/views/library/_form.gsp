<%@ page import="com.grailstest.Library" %>



<div class="fieldcontain ${hasErrors(bean: libraryInstance, field: 'booksCount', 'error')} required">
	<label for="booksCount">
		<g:message code="library.booksCount.label" default="Books Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="booksCount" type="number" value="${libraryInstance.booksCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: libraryInstance, field: 'book', 'error')} ">
	<label for="book">
		<g:message code="library.book.label" default="Book" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${libraryInstance?.book?}" var="b">
    <li><g:link controller="book" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="book" action="create" params="['library.id': libraryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'book.label', default: 'Book')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: libraryInstance, field: 'signUpDate', 'error')} required">
	<label for="signUpDate">
		<g:message code="library.signUpDate.label" default="Sign Up Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="signUpDate" precision="day"  value="${libraryInstance?.signUpDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: libraryInstance, field: 'students', 'error')} ">
	<label for="students">
		<g:message code="library.students.label" default="Students" />
		
	</label>
	<g:select name="students" from="${com.grailstest.Student.list()}" multiple="multiple" optionKey="id" size="5" value="${libraryInstance?.students*.id}" class="many-to-many"/>
</div>

