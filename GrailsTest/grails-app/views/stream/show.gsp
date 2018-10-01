
<%@ page import="com.grailstest.Stream" %>
<%@ page import="com.grailstest.Subject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stream.label', default: 'Stream')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stream" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
<%--				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
<%--				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%--%>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-stream" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stream">
			
				<g:if test="${streamInstance?.coursename}">
				<li class="fieldcontain">
					<span id="coursename-label" class="property-label"><g:message code="stream.coursename.label" default="Coursename" /></span>
					
						<span class="property-value" aria-labelledby="coursename-label"><g:fieldValue bean="${streamInstance}" field="coursename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${streamInstance?.lectures}">
				<li class="fieldcontain">
					<span id="lectures-label" class="property-label"><g:message code="stream.lectures.label" default="Lectures" /></span>
					
						<g:each in="${streamInstance.lectures}" var="l">
						<span class="property-value" aria-labelledby="lectures-label"><g:link controller="lecture" action="show" id="${l?.id}">${l?.firstName?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${streamInstance?.subjects}">
				<li class="fieldcontain">
					<span id="subjects-label" class="property-label"><g:message code="stream.subjects.label" default="Subjects" /></span>
					
						<g:each in="${streamInstance.subjects}" var="s">
						<span class="property-value" aria-labelledby="subjects-label"><g:link controller="subject" action="show" id="${s.id}">${s?.name?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

				</ol>
<%--				<table>--%>
<%--				<g:if test="${streamInstance?.ltt}">--%>
<%--				<thead>--%>
<%--					<tr>--%>
<%--					--%>
<%--						<th><g:message code="lectureTimeTable.lecture.label" default="Lecture" /></th>--%>
<%--					--%>
<%--						<th><g:message code="lectureTimeTable.stream.label" default="Stream" /></th>--%>
<%--					--%>
<%--						<th><g:message code="lectureTimeTable.subject.label" default="Subject" /></th>--%>
<%--					--%>
<%--						<g:sortableColumn property="year" title="${message(code: 'lectureTimeTable.year.label', default: 'Year')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="peroid" title="${message(code: 'lectureTimeTable.peroid.label', default: 'Peroid')}" />--%>
<%--					--%>
<%--					</tr>--%>
<%--				</thead>--%>
<%--				</g:if>--%>
<%--				<tbody>--%>
<%--				<g:each in="${streamInstance.ltt}" status="i" var="lectureTimeTableInstance">--%>
<%--					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--%>
<%--					--%>
<%--						<td>${fieldValue(bean: lectureTimeTableInstance, field: "lecture.firstName")}</td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: lectureTimeTableInstance, field: "stream.coursename")}</td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: lectureTimeTableInstance, field: "subject.name")}</td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: lectureTimeTableInstance, field: "year")}</td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: lectureTimeTableInstance, field: "peroid")}</td>--%>
<%--					--%>
<%--					</tr>--%>
<%--				</g:each>--%>
<%--				</tbody>--%>
<%--			</table>--%>
<%--			--%>

 <table>
 
    <tr>
        <th>Days</th>
        <th>FirstPeroid</th>
        <th>SecondPeroid</th>
        <th>ThirdPeroid</th>
        <th>FourthPeroid</th>
        <th>FifthPeroid</th>
        
    </tr>


    <tr>
      <th>Monday</th>
      
    <g:if test="${streamInstance?.ltt.findAll{it.day=='1' && it.peroid=='Fisrt period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='1' && it.peroid=='Fisrt period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
        
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

            <g:if test="${streamInstance?.ltt.findAll{it.day=='1' && it.peroid=='Second period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='1' && it.peroid=='Second period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${streamInstance?.ltt.findAll{it.day=='1' && it.peroid=='Third period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='1' && it.peroid=='Third period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${streamInstance?.ltt.findAll{it.day=='1' && it.peroid=='Fourth period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='1' && it.peroid=='Fourth period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
   <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
     
      <g:if test="${streamInstance?.ltt.findAll{it.day=='1' && it.peroid=='Fifth period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='1' && it.peroid=='Fifth period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
     <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
    </tr>

    <tr>
       <th>Tuesday</th>
        
                <g:if test="${streamInstance?.ltt.findAll{it.day=='2' && it.peroid=='Fisrt period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='2' && it.peroid=='Fisrt period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
        
          </g:each>
      </g:if>
      <g:else>
     <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

            <g:if test="${streamInstance?.ltt.findAll{it.day=='2' && it.peroid=='Second period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='2' && it.peroid=='Second period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${streamInstance?.ltt.findAll{it.day=='2' && it.peroid=='Third period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='2' && it.peroid=='Third period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${streamInstance?.ltt.findAll{it.day=='2' && it.peroid=='Fourth period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='2' && it.peroid=='Fourth period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
     
      <g:if test="${streamInstance?.ltt.findAll{it.day=='2' && it.peroid=='Fifth period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='2' && it.peroid=='Fifth period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
    </tr>

    <tr>
        
         <th>Wednesday</th>
          
            <g:if test="${streamInstance?.ltt.findAll{it.day=='3' && it.peroid=='Fisrt period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='3' && it.peroid=='Fisrt period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
        
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

            <g:if test="${streamInstance?.ltt.findAll{it.day=='3' && it.peroid=='Second period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='3' && it.peroid=='Second period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${streamInstance?.ltt.findAll{it.day=='3' && it.peroid=='Third period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='3' && it.peroid=='Third period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${streamInstance?.ltt.findAll{it.day=='3' && it.peroid=='Fourth period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='3' && it.peroid=='Fourth period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
     
      <g:if test="${streamInstance?.ltt.findAll{it.day=='3' && it.peroid=='Fifth period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='3' && it.peroid=='Fifth period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

    </tr>

<tr>
        
         <th>Thursday</th>
          
            <g:if test="${streamInstance?.ltt.findAll{it.day=='4' && it.peroid=='Fisrt period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='4' && it.peroid=='Fisrt period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
        
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

            <g:if test="${streamInstance?.ltt.findAll{it.day=='4' && it.peroid=='Second period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='4' && it.peroid=='Second period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
     <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${streamInstance?.ltt.findAll{it.day=='4' && it.peroid=='Third period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='4' && it.peroid=='Third period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${streamInstance?.ltt.findAll{it.day=='4' && it.peroid=='Fourth period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='4' && it.peroid=='Fourth period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
     
      <g:if test="${streamInstance?.ltt.findAll{it.day=='4' && it.peroid=='Fifth period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='4' && it.peroid=='Fifth period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

    </tr>


    <tr>
        <th>Friday</th>
        
                   <g:if test="${streamInstance?.ltt.findAll{it.day=='5' && it.peroid=='Fisrt period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='5' && it.peroid=='Fisrt period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
        
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>

            <g:if test="${streamInstance?.ltt.findAll{it.day=='5' && it.peroid=='Second period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='5' && it.peroid=='Second period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${streamInstance?.ltt.findAll{it.day=='5' && it.peroid=='Third period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='5' && it.peroid=='Third period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
     <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
      <g:if test="${streamInstance?.ltt.findAll{it.day=='5' && it.peroid=='Fourth period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='5' && it.peroid=='Fourth period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
     
      <g:if test="${streamInstance?.ltt.findAll{it.day=='5' && it.peroid=='Fifth period'}}">
   
    <g:each in="${streamInstance?.ltt.findAll{it.day=='5' && it.peroid=='Fifth period'}}" var="ltt">
     
         <td> <g style="color:green;">${ltt?.lecture?.firstName} </g><br> ${ltt?.subject?.name }  </td>
         
          </g:each>
      </g:if>
      <g:else>
      <td style="color: red;">Not Yet Scheduled</td>
      </g:else>
      
    </tr>
</table>
			
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${streamInstance?.id}" />
					<g:link class="edit" action="edit" id="${streamInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
