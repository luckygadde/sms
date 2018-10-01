<%@ page import="com.grailstest.Student" %>
<script type="text/javascript">
function isValidEmailAddress() {
	 var emailAddress = document.getElementById('email').value;
	    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
<%--			    return pattern.test(emailAddress);--%>

	    if (pattern.test(emailAddress)) {
	    	return true;
	    	}
	    	else {
		    	alert("Please enter valid email.contain(@,.)")
	    	return false;
	    	}


		}
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
</script>
<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="student.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${studentInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="student.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${studentInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'dob', 'error')} required">
	<label for="dob">
		<g:message code="student.dob.label" default="Dob" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dob" precision="day"  value="${studentInstance?.dob}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="student.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
<%--	<g:textField name="gender" required="" value="${studentInstance?.gender}"/>--%>
	<g:select name="gender" from="['Male', 'Female']"
          noSelection="['':'-Choose your gender-']" required="" value="${studentInstance?.gender}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="student.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${studentInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="student.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${studentInstance?.email}" onblur="isValidEmailAddress()"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="student.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${studentInstance?.phone}" onkeypress="return isNumber(event)" maxlength="10"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="student.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" min="18" max="65" value="${studentInstance.age}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'studyyear', 'error')} required">
	<label for="studyyear">
		<g:message code="student.studyyear.label" default="Studyyear" />
		<span class="required-indicator">*</span>
	</label>
<%--	<g:textField name="studyyear" required="" value="${studentInstance?.studyyear}" />--%>
	 <g:select name="studyyear"  required="" value="${studentInstance?.studyyear}" from="['Fisrt Year', 'Second Year','Third Year','Fourth Year']"
          noSelection="['':'-Select One-']" />
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'stream', 'error')} required">
	<label for="stream">
		<g:message code="student.stream.label" default="Streams" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stream" name="stream.id" from="${com.grailstest.Stream.list()}" optionKey="id" optionValue="coursename" required="" value="${studentInstance?.stream?.coursename}" class="many-to-one"/>
</div>
<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'userName', 'error')} required">
	<label for="username">
		<g:message code="student.username.label" default="UserName" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${studentInstance?.userName}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="student.password.label" default="password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${studentInstance?.password}"/>
</div>
