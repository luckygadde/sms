<%@ page import="com.grailstest.StaffType; com.grailstest.Lecture" %>

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

<div class="fieldcontain ${hasErrors(bean: lectureInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="lecture.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${lectureInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lectureInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="lecture.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${lectureInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lectureInstance, field: 'dob', 'error')} ">
	<label for="dob">
		<g:message code="lecture.dob.label" default="Dob" />
		
	</label>
	<g:datePicker name="dob" precision="day"  value="${lectureInstance?.dob}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: lectureInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="lecture.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
<%--	<g:textField name="gender" required="" value="${lectureInstance?.gender}"/>--%>
	<g:select name="gender" from="['Male', 'Female']"
          noSelection="['':'-Choose your gender-']" value="${lectureInstance?.gender}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: lectureInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="lecture.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${lectureInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lectureInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="lecture.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${lectureInstance?.email}" onblur="isValidEmailAddress()"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lectureInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="lecture.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${lectureInstance?.phone}" onkeypress="return isNumber(event)" maxlength="10"/>
</div>
<%--%{----%>
<%--<div class="fieldcontain ${hasErrors(bean: lectureInstance, field: 'ltt', 'error')} required">--%>
<%--	<label for="ltt">--%>
<%--		<g:message code="lecture.ltt.label" default="Ltt" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="ltt" name="ltt.id" from="${com.grailstest.LectureTimeTable.list()}" optionKey="id" required="" value="${lectureInstance?.ltt?.id}" class="many-to-one"/>--%>
<%--</div>--}%--%>

<div class="fieldcontain ${hasErrors(bean: lectureInstance, field: 'staff', 'error')} required">
	<label for="staff">
		<g:message code="lecture.staff.label" default="Staff" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select name="staff" from="${com.grailstest.StaffType?.values()}" keys="${com.grailstest.StaffType.values()*.name()}" required="" value="${lectureInstance?.staff?.name()}"/>--}%
    ${StaffType.TEACHING}
</div>

<div class="fieldcontain ${hasErrors(bean: lectureInstance, field: 'stream', 'error')} required">
	<label for="stream">
		stream
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stream" name="stream.id" from="${com.grailstest.Stream.list()}" optionKey="id"  optionValue="coursename" required="" value="${lectureInstance?.stream?.id}" class="many-to-one"/>
</div>
<div class="fieldcontain ${hasErrors(bean: lectureInstance, field: 'userName', 'error')} required">
	<label for="username">
		<g:message code="lecture.username.label" default="UserName" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${lectureInstance?.userName}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: lectureInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="lecture.password.label" default="password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${lectureInstance?.password}"/>
</div>
