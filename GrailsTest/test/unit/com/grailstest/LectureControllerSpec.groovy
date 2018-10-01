package com.grailstest

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification
import grails.test.mixin.TestFor

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@TestFor(LectureController)
@Mock([Lecture,Stream,LectureTimeTable])
class LectureControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }
	void "test index"(){
		when:
		controller.index()
		then:
		response.redirectedUrl == "/lecture/list"
	}
	void "test list"(){
		when:
      Lecture lectureinst= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456').save()
		
		def model=controller.list(1)
		then:
		
		model.lectureInstanceList==[lectureinst]
	}
	
	void "test save"() {
		
		when:
//		Lecture lectureinst= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE"),userName:'fred',password:'123456').save()
//		Stream s = new Stream(coursename:"CSE").save()
		params.firstName ='fred'
			params.lastName='flintstone'
			params.address='rocky street'
			params.gender='Male'
			params.email='abcd@gmail.com'
			params.phone='9856985698'
			params.dob=new Date()
			params.studyyear="First Year"
			
			params.stream=new Stream(coursename:"CSE").save()
			params.userName='fred'
			params.password='123456'
			
			request.method="POST"
		controller.save()

		then:
	response.redirectUrl == "/lecture/show/1"
	}

    void "test show"() {
		when:
		Lecture lectureinst= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456').save()
		params.firstName=1
		def res=controller.show(params.long('firstName'))

		then:
		if(lectureinst)
//		response.redirectUrl == "/lecture/show"
		res.lectureInstance=lectureinst
		else
	response.redirectUrl == "/lecture/list"
    }
	
	void "test edit"() {
		when:
		Lecture lectureinst= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456').save()
		params.firstName=1
		def res=controller.edit(params.long('firstName'))

		then:
	if(lectureinst)
//		response.redirectUrl == "/lecture/edit"
	res.lectureInstance=lectureinst
		else
	response.redirectUrl == "/lecture/list"
	}
	
	void "test update"() {
		when:
		Lecture lectureinst= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456').save()
		params.firstName=1
		params.version=1
		request.method="POST"
		def model=controller.update(params.long('firstName'),params.long('version'))

		then:
	
	if (lectureinst.version > params.version) {
		response.redirectUrl == "/lecture/edit/1"
		model.lectureInstance == lectureinst

		}
		if(lectureinst)
		response.redirectUrl == "/lecture/show/1"
		else
		  response.redirectUrl == "/lecture/edit/1"
	
	}
	
	void "test delete"() {
		when:
		  Lecture lectureinst= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456').save()
		params.firstName=1
		
		request.method="POST"
		println "dsfsfds=="+params
		controller.delete(params.long('firstName'))
		

		then:
		
		if(lectureinst)
	response.redirectUrl == "/lecture/list"
	else
	response.redirectUrl == "/lecture/show"
	}
	
	void "test showsinglelecture"() {
		when:
		Lecture lectureinst= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456').save()
	  params.firstName=1
	 def res= controller.showsinglelecture(params.long('firstName'))
	  then:
	  
	  if(!lectureinst)
  response.redirectUrl == "/lecture/list"
  else
//  response.redirectUrl == "/lecture/showsinglelecture"
  res.lectureInstance==lectureinst
	}
}
