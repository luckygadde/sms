<%@ page import="com.grailstest.LectureTimeTable" %>
<div class="fieldcontain ${hasErrors(bean: lectureTimeTableInstance, field: 'lecture', 'error')} required">
	<label for="lecture">
		<g:message code="lectureTimeTable.lecture.label" default="Lecture" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lecture" name="lectureid" from="${com.grailstest.Lecture.list()}" optionKey="id" optionValue="firstName" required="" value="${lectureTimeTableInstance?.lecture?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lectureTimeTableInstance, field: 'stream', 'error')} required">
	<label for="stream">
		<g:message code="lectureTimeTable.stream.label" default="Stream" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stream" name="stream.id" from="${com.grailstest.Stream.list()}" noSelection="['':'-Choose your Stream-']" optionKey="id" optionValue="coursename"  required="" value="${lectureTimeTableInstance?.stream?.id}" class="many-to-one" onchange="loadsubjects(this.value);"/>
</div>



<div class="fieldcontain ${hasErrors(bean: lectureTimeTableInstance, field: 'subject', 'error')} required">
    <div id="wait" style="display:none;width:69px;height:89px;border:1px solid black;position:absolute;top:50%;left:50%;padding:2px;"><img src='${resource(dir: 'images', file: 'loading.gif')}' width="64" height="64" /><br>Loading..</div>
	<label for="subject">
		<g:message code="lectureTimeTable.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
<%--	%{--<g:select id="subject" name="subject.id" from="${com.grailstest.Subject.list()}" optionKey="id" optionValue="name"  required="" value="${lectureTimeTableInstance?.subject?.id}" class="many-to-one"/>--}%--%>
    <g:select name="subjectid"   id="subjctid" from="${com.grailstest.Subject.list()}" noSelection="['':'-Choose your Subject-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lectureTimeTableInstance, field: 'day', 'error')} required ">
	<label for="day">
		<g:message code="lectureTimeTable.peroid.label" default="Day" />
		<span class="required-indicator">*</span>
	</label>

    <g:select name="day" from="['Monday ', 'Tuesday ','Wednesday','Thursday ','Friday']"
              noSelection="['':'-Choose your day-']" keys="${[1,2,3,4,5]}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lectureTimeTableInstance, field: 'peroid', 'error')} required">
	<label for="peroid">
		<g:message code="lectureTimeTable.peroid.label" default="Peroid" />
		<span class="required-indicator">*</span>
	</label>

    <g:select name="peroid" from="['Fisrt period ', 'Second period ','Third period ','Fourth period ','Fifth period ']"
              noSelection="['':'-Choose your peroid-']" />
              
              
</div>

<div class="fieldcontain ${hasErrors(bean: lectureTimeTableInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="lectureTimeTable.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
    <g:select name="year" from="['Fisrt Year', 'Second Year','Third Year','Fourth Year']"
              noSelection="['':'-Choose your year-']" />
</div>



