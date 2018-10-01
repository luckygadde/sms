package com.grailstest

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@TestFor(StudentController)
@Mock([Student,Stream,MailserviceService])
class StudentControllerSpec extends Specification {
	MailserviceService mailserviceService=Mock(MailserviceService)
    def setup() {
    }

    def cleanup() {
    }

   
	void "test save"() {
		
		
		when:
		params.firstName ='fred'
			params.lastName='flintstone'
			params.address='rocky street'
			params.gender='Male'
			params.age='25'
			params.email='abcd@gmail.com'
			params.phone='9856985698'
			params.dob=new Date()
			params.studyyear="First Year"
			
			params.stream=new Stream(coursename:"CSE")
			params.userName='fred'
			params.password='123456'
			params.domaintype='1'
			request.method="POST"
			
		controller.save()
//		mailserviceService.sendSucessMail(params)
		then:
	response.redirectUrl == "/student/show/1"
	}
	
	void "test show"() {
		when:
			Student student= new Student(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456',age:'25').save()
		params.firstName=1
		def res=controller.show(params.long('firstName'))

		then:
		if(student)
//		response.redirectUrl == "/lecture/show"
		res.studentInstance=[student]
		else
	response.redirectUrl == "/student/list"
	}
	
	void "test edit"() {
		when:
		Student student= new Student(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456',age:'25').save()
		params.firstName=1
		def res=controller.edit(params.long('firstName'))

		then:
		if(student)
//		response.redirectUrl == "/lecture/show"
		res.studentInstance=[student]
		else
	response.redirectUrl == "/student/list"
	}
	
	void "test update"() {
		when:
		Student student= new Student(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456',age:'25').save()
		params.firstName=1
		params.version=1
		request.method="POST"
		def model=controller.update(params.long('firstName'),params.long('version'))

		then:
	
	if (student.version > params.version) {
		response.redirectUrl == "/student/edit/1"
		model.studentInstance == student

		}
		if(student)
		response.redirectUrl == "/student/show/1"
		else
		  response.redirectUrl == "/student/edit/1"

	
	}
	
	void "test delete"() {
		when:
		  Student student= new Student(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456',age:'25').save()
		params.firstName=1
		
		request.method="POST"
		println "dsfsfds=="+params
		controller.delete(params.long('firstName'))
		

		then:
		
		if(student)
	response.redirectUrl == "/student/list"
	else
	response.redirectUrl == "/student/show"
	}
}
