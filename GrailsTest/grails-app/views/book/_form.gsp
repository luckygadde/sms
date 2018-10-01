<%@ page import="com.grailstest.Book" %>
<script>
function isNumber(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		}
</script>		
<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="book.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${bookInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'authorName', 'error')} required">
	<label for="authorName">
		<g:message code="book.authorName.label" default="Author Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="authorName" required="" value="${bookInstance?.authorName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'copies', 'error')} required">
    <label for="copies">
        Copies
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="copies" required="" value="${bookInstance?.copies}" onkeypress="return isNumber(event)"/>
</div>

<%--%{----%>
<%--<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'library', 'error')} required">--%>
<%--	<label for="library">--%>
<%--		<g:message code="book.library.label" default="Library" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="library" name="library.id" from="${com.grailstest.Library.list()}" optionKey="id" required="" value="${bookInstance?.library?.id}" class="many-to-one"/>--%>
<%--</div>--%>
<%----}%--%>

