 <%@ page import="com.grailstest.Staff; com.grailstest.Stream" %>
<html>
	<head>
		<meta name="layout" content="main2">

 <title>Registration Form </title>

 <script type="text/javascript">
		function isNumber(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		}


             function isValiduserName(){

            	 document.getElementById('firstvalue').innerHTML="";
    			 document.getElementById('lastvalue').innerHTML="";
    			 document.getElementById('domaintypevalue').innerHTML="";
    			 document.getElementById('streamtype').innerHTML="";
    <%--			 document.getElementById('professiontype').innerHTML="";--%>
    			 document.getElementById('studyyr').innerHTML="";
    			 document.getElementById('agevalue').innerHTML="";
    			 document.getElementById('addressvalue').innerHTML="";
    			  document.getElementById('phonevalue').innerHTML="";
    			  document.getElementById('emailid').innerHTML="";
    			  document.getElementById('date').innerHTML="";

            	 var username = document.getElementById('userName').value;
    			 var domaintyp=document.getElementById('domaintype').value;
            	 $.ajax({
               	  url:"${g.createLink(controller:'home',action:'verifyusername')}",
                     type:'POST',
                     data: {username:username,domaintyp:domaintyp},
                     success: function(data) {
                    
                         document.getElementById('usrnme').innerHTML=data;
                     },
<%--                        --%>
<%--                          success:function(data,textStatus){$('#emailid').html(data);},--%>
<%--                          error:function(XMLHttpRequest,textStatus,errorThrown){}--%>
                
                     }
                 
                 );
           }
		
		function isValidEmailAddress() {

			 document.getElementById('firstvalue').innerHTML="";
			 document.getElementById('lastvalue').innerHTML="";
			 document.getElementById('domaintypevalue').innerHTML="";
			 document.getElementById('streamtype').innerHTML="";
<%--			 document.getElementById('professiontype').innerHTML="";--%>
			 document.getElementById('studyyr').innerHTML="";
			 document.getElementById('agevalue').innerHTML="";
			 document.getElementById('addressvalue').innerHTML="";
			  document.getElementById('phonevalue').innerHTML="";
			  document.getElementById('emailid').innerHTML="";
			  document.getElementById('date').innerHTML="";
			  
			 var emailAddress = document.getElementById('email').value;
			 var domaintyp=document.getElementById('domaintype').value;
			    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;

			    if (pattern.test(emailAddress)) {

                      $.ajax({
                    	  url:"${g.createLink(controller:'home',action:'verifyemail')}",
                          type:'POST',
                          data: {emailaddrss:emailAddress,domaintyp:domaintyp},
                          success: function(data) {
                         
                              document.getElementById('emailid').innerHTML=data;
                          },
<%--                        --%>
<%--                          success:function(data,textStatus){$('#emailid').html(data);},--%>
<%--                          error:function(XMLHttpRequest,textStatus,errorThrown){}--%>
                     
                          }
                      
                      );
                     
			    	return true;
			    	}
			    	else {
                document.getElementById('emailid').innerHTML="Please enter valid email.contain(@,.)";
                document.getElementById('email').value="";
			    	return false;
			    	}


				}
		function hideStream(elem){
			
			if(elem.value=='3' || elem.value==3 ){
	          document.getElementById('streamid').style.display='none'
			}  
	          else{
	        	  document.getElementById('streamid').style.display='table-row'
	          }
	          
	        if(elem.value=='2' || elem.value==2 && elem.value=='3' || elem.value==3 ){

    	        document.getElementById('yearid').style.display='none'
    	        	document.getElementById('ageid').style.display='none'	

	        	}	  
	           else{
	        	  document.getElementById('yearid').style.display='table-row'
	        		  document.getElementById('ageid').style.display='table-row'
	        	 }
       	 	
<%--	        if(elem.value=='2' || elem.value==2 && elem.value=='1' || elem.value==1){--%>
<%--        	        	  document.getElementById('username').style.display='table-row'--%>
<%--        	 	        	 document.getElementById('passworD').style.display='table-row'--%>
<%--	        	}	  --%>
<%--	           else{--%>
<%--	        	   document.getElementById('username').style.display='none'--%>
<%--	        	        document.getElementById('passworD').style.display='none'--%>
<%--	        	 }--%>
		}
		 function validatefeilds(){
			 document.getElementById('firstvalue').innerHTML="";
			 document.getElementById('lastvalue').innerHTML="";
			 document.getElementById('domaintypevalue').innerHTML="";
			 document.getElementById('streamtype').innerHTML="";
<%--			 document.getElementById('professiontype').innerHTML="";--%>
			 document.getElementById('studyyr').innerHTML="";
			 document.getElementById('agevalue').innerHTML="";
			 document.getElementById('addressvalue').innerHTML="";
			  document.getElementById('phonevalue').innerHTML="";
			  document.getElementById('emailid').innerHTML="";
			  document.getElementById('date').innerHTML="";

			   if(document.getElementById('firstName').value==""){
         document.getElementById('firstvalue').innerHTML="Please Give The FirstName";
           return false;
				   
			   }
			  
			   if(document.getElementById('lastName').value==""){
			 document.getElementById('lastvalue').innerHTML="Please Give The LastName";
				   return false;
			   }
			  
			   if(document.getElementById('domaintype').value==0){
				    document.getElementById('domaintypevalue').innerHTML="Please Select The DomainType";
				   return false;
			   }
			   if(document.getElementById('domaintype').value!=3){
			   if(document.getElementById('stream').value==""){
                 document.getElementById('streamtype').innerHTML="Please Select The Stream";
				   return false;
			   }
			   }
<%--			   if(document.getElementById('domaintype').value==3){--%>
<%--			   if(document.getElementById('professionype').value==0){--%>
<%--				 document.getElementById('professiontype').innerHTML="Please Select The ProfessionType";--%>
<%--				   return false;--%>
<%--			   }--%>
<%--			   }--%>
			   if(document.getElementById('domaintype').value==1){
			   if(document.getElementById('studyyear').value==""){
				  document.getElementById('studyyr').innerHTML="Please Select The StudyYearType";
				   return false;
			   }
			   if(document.getElementById('age').value==""){
				   document.getElementById('agevalue').innerHTML="Please Select The Age";
				   return false;
			   }
			   }
			   if(document.getElementById('address').value==""){
				   document.getElementById('addressvalue').innerHTML="Please Give The Address";
				   return false;
			   }
			   if(document.getElementById('email').value==""){
				   document.getElementById('emailid').innerHTML="Please Give The Email";
				   return false;
			   }

			   if(document.getElementById('userName').value==""){
				   document.getElementById('usrnme').innerHTML="Please Give The UserName.";
				   return false;
			   }
			   if(document.getElementById('password').value==""){
				   document.getElementById('pswrd').innerHTML="Please Give The Password.";
				   return false;
			   }
			   if(document.getElementById('phone').value==""){
				   document.getElementById('phonevalue').innerHTML="Please Give The PhoneNumber";
				   return false;
			   }
			  
			   if(document.getElementById('datepicker').value==""){
				   document.getElementById('date').innerHTML="Please Select The Date";
				   return false;
			   }
			   
			   return true;
		   }

		 

		</script>
		
	</head>

	<body style="background-color: orange;">
		<g:form name="form" controller="home" id="form" >
		<div><h1 style="text-align: center;">Registration Form</h1></div>
		<div>
		<table style="width: 1100px;">
</table>
		<table id="studenttable" BORDER=2 RULES=NONE >
		<tr>
		<td >First Name  : </td>
		<td><g:textField name="firstName" value="" maxlength="10"  value="${content?.firstName}" /></td>
         <td style="color: red;" id="firstvalue"></td>
		</tr>
			<tr>
			<td>Last Name:</td>
			<td><g:textField name="lastName" value="${ content?.lastName}" /></td>
			 <td style="color: red;" id="lastvalue"></td>
			</tr>
			<tr>
			<td>Gender :</td>
             <td>
<%--             %{--<g:select name="gender" from="['Male', 'Female']"--%>
<%--          noSelection="['':'-Choose your gender-']"/>--}%--%>
                 <p>Male  : <input type="radio" name="gender" value="Male"  checked="checked" /> Female: <input type="radio" name="gender" value="Female" /></p>
             </td>

			</tr>

			<tr>
			<td>Domain Type :</td>
             <td>
             <g:select name="domaintype" from="['Student', 'Lecture','Staff']"
          noSelection="['':'-Select One-']" keys="${[1,2,3]}" onchange="hideStream(this);" value="${content?.domaintype }"/>
          
             </td>
        <td style="color: red;" id="domaintypevalue"></td>
			</tr>

			<tr id="streamid"  >

			<td>Stream :</td>
             <td>
             <g:select name="stream" from="${Stream.list()*.coursename }"
          noSelection="['':'-Select One-']" value="${content?.stream?.coursename}"/>
             </td>
             <td style="color: red;" id="streamtype"></td>
			</tr>

<%--			<tr id="profession">--%>
<%--			<td>Profession Type :</td>--%>
<%--             <td>--%>
<%--             <g:select name="professionype" from="${Staff.list*.staff. }"--%>
<%--          noSelection="['':'-Select One-']" value=""/>--%>
<%--             </td>--%>
<%--              <td style="color: red;" id="professiontype"></td>--%>
<%----%>
<%----%>
<%--			</tr>--%>

			<tr id="yearid"  >
			<td>Year :</td>
             <td>
             <g:select name="studyyear" from="['Fisrt Year', 'Second Year','Third Year','Fourth Year']"
          noSelection="['':'-Select One-']" value="${ content?.studyyear}" />
             </td>
             <td style="color: red;" id="studyyr"></td>
             
			</tr>

			<tr id="ageid">
			<td>
			Age :
			</td>
<%--			<td><g:textField name="age" value="" onkeypress="return isNumber(event)"/></td>--%>
		<td>	<g:select name="age" from="${18..65}" value="${content?.age}"
          noSelection="['':'-Select One-']"/>
			</td>
			<td style="color: red;" id="agevalue"></td>
			</tr>

			<tr>
			<td>Address :</td>
                <td><g:textArea name="address" value="${ content?.address}" /></td>
                <td style="color: red;" id="addressvalue"></td>
			</tr>
			<tr>
			<td>Email-id :</td>
			<td><g:textField name="email" value="${content?.email}" onblur="return isValidEmailAddress()"/></td>
			<td style="color: red;" id="emailid"></td>
			<g:hasErrors bean="${content}">
           <div class="errors">
           <g:renderErrors bean="${content}" as="list" />
           </div>
           </g:hasErrors>
			</tr>
			<tr id="username" >
            <td>UserName :</td>
            <td><g:textField name="userName" value="${content?.userName}" onblur="return isValiduserName()" /></td>
            <td style="color: red;" id="usrnme"></td>
 	 		</tr>
			<tr id="passworD" >
			<td>Password :</td>
			<td><g:passwordField name="password" value="${content?.password}" maxlength="10"/></td>
			  <td style="color: red;" id="pswrd"></td>
			</tr>
			<tr>
			<td>Phone :</td>
			<td><g:textField name="phone" value="${ content?.phone}" onkeypress="return isNumber(event)" maxlength="10" /></td>
			<td style="color: red;" id="phonevalue"></td>
			
			</tr>
            <tr>
			<td>DOB :</td>
			<td><g:textField name="dob" id="datepicker" value=""/></td>
				<td style="color: red;" id="date"></td>
			</tr>
			

			<tr>
			<td style="text-align: center;" colspan="3"><g:actionSubmit value="Submit" onclick="return validatefeilds()" action="Register"/></td>

			</tr>

		</table>
		</div>
		</g:form>
	</body>
</html>