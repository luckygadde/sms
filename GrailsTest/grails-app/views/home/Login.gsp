<html>
<head>
<meta name="layout" content="main2"/>
<title>Login Page</title>
</head>


<body>
<h1 style="text-align: center;">Login For Admin/Lecture/Student</h1>
<g:if test="${flash.message}">
  <div class="message" style="display: block;color: red;">${flash.message}</div>
</g:if>
<g:form controller="home" name="from">
<table style="border: 1px solid black;">
<tr>
			<td>Domain Type :</td>
             <td>
             <g:select name="domaintype" from="['Student', 'Lecture','Admin']"
          noSelection="['':'-Select One-']" keys="${[1,2,3]}"  value="${content?.domaintype }" required=""/>
          
             </td>
        
			</tr>
<tr>
<td>UserName :</td>
<td><g:textField name="userName" value="" required=""/></td>
</tr>
<tr>
<td>Password :</td>
<td><g:passwordField name="password" required=""/></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;"><g:actionSubmit value="Login" action="LoginVerify"/></td>
</tr>
</table>
</g:form>
</body>
</html>