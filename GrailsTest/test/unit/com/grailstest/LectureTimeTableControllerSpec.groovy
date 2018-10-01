package com.grailstest

import com.grailstest.LectureTimeTableController
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(LectureTimeTableController)
@TestMixin(GrailsUnitTestMixin)
@Mock([LectureTimeTable,Lecture,Stream,Subject,MailserviceService])
class LectureTimeTableControllerSpec extends Specification {
	MailserviceService mailserviceService=Mock(MailserviceService)
    def setup() {
    }

    def cleanup() {
    }
	
	void "test index"(){
		when:
		controller.index()
		then:
		response.redirectedUrl == "/lectureTimeTable/list"
	}
	void "test list"(){
		when:
	    Lecture lecture= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE"),userName:'fred',password:'123456').save()
		Stream stream=new Stream(coursename:'CSE').save(flush:true)
		Subject subject=new Subject(name:"computer",stream:new Stream(coursename:'CSE').save(flush:true),year:"First Year").save(flush:true)
		LectureTimeTable ltt=new LectureTimeTable(year:"First Year",peroid:"First Peroid",day:new Date(),lecture:lecture,stream:stream,subject:subject).save(flush:true,failonError:true)
		
		def model=controller.list(1)
		then:
		
		model.lectureTimeTableInstanceList==[ltt]
	}
    void "test save"() {
		
		when:
		Lecture lectureinst= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE"),userName:'fred',password:'123456').save()
		Stream stream=new Stream(coursename:'CSE').save(flush:true)
		Subject subject=new Subject(name:"computer",stream:new Stream(coursename:'CSE').save(flush:true),year:"First Year").save(flush:true)
		params.year='First Year'
		params.peroid='First Peroid'
	
		params.subjectid=1
		params.stream=1
		params.lectureid=1
		params.day='1'
		request.method="POST"
		println"lect=="+lectureinst
		println"subj=="+Subject
		println"stream=="+stream
		controller.save()
		then:
		response.redirectedUrl == "/lectureTimeTable/show/1"
		
    }
	void "test showTimeTable"() {
		when:
		Lecture lecture= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE"),userName:'fred',password:'123456').save()
		Stream stream=new Stream(coursename:'CSE').save(flush:true)
		Subject subject=new Subject(name:"computer",stream:new Stream(coursename:'CSE').save(flush:true),year:"First Year").save(flush:true)
		LectureTimeTable ltt=new LectureTimeTable(year:"First Year",peroid:"First Peroid",day:new Date(),lecture:lecture,stream:stream,subject:subject).save(flush:true,failonError:true)
		params.lecture=1
		println"fadafsdsa"+ltt
		def res = controller.showTimeTable(params.long('lecture'))
		

		then:
//		assertEquals(res.lectureTimeTableInstanceList,[ltt]) // it is also correct
		res.lectureTimeTableInstanceList == [ltt]
		
	}
	void "test edit"() {
		when:
		Lecture lecture= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE"),userName:'fred',password:'123456').save()
		Stream stream=new Stream(coursename:'CSE').save(flush:true)
		Subject subject=new Subject(name:"computer",stream:new Stream(coursename:'CSE').save(flush:true),year:"First Year").save(flush:true)
		LectureTimeTable ltt=new LectureTimeTable(year:"First Year",peroid:"First Peroid",day:new Date(),lecture:lecture,stream:stream,subject:subject).save(flush:true,failonError:true)
		params.lecture=1
		def model=controller.edit(params.long('lecture'))

		then:
		if(ltt)
		
//		  response.redirectUrl == "/book/edit/1"
		model.lectureTimeTableInstanceList==[ltt]
		else
		response.redirectUrl == "/lectureTimeTable/list"
	
	}
	
	void "test show"() {
		when:
		Lecture lecture= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE"),userName:'fred',password:'123456').save()
		Stream stream=new Stream(coursename:'CSE').save(flush:true)
		Subject subject=new Subject(name:"computer",stream:new Stream(coursename:'CSE').save(flush:true),year:"First Year").save(flush:true)
		LectureTimeTable ltt=new LectureTimeTable(year:"First Year",peroid:"First Peroid",day:new Date(),lecture:lecture,stream:stream,subject:subject).save(flush:true,failonError:true)
		params.lecture=1
		def model=controller.show(params.long('lecture'))

		then:
		if(!ltt)
		response.redirectUrl == "/lectureTimeTable/list"
		else
//		response.redirectUrl == "/book/show"
		model.lectureTimeTableInstanceList==[ltt]
	}
	
	void "test update"() {
		when:
		Lecture lecture= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE"),userName:'fred',password:'123456').save()
		Stream stream=new Stream(coursename:'CSE').save(flush:true)
		Subject subject=new Subject(name:"computer",stream:new Stream(coursename:'CSE').save(flush:true),year:"First Year").save(flush:true)
		LectureTimeTable ltt=new LectureTimeTable(year:"First Year",peroid:"First Peroid",day:new Date(),lecture:lecture,stream:stream,subject:subject).save(flush:true,failonError:true)
		params.lecture=1
		params.version=1
		request.method="POST"
		println "dsfsfds=="+params
		def model=controller.update(params.long('lecture'),params.long('version'))

		then:
		
		if (ltt.version > params.version) {
		response.redirectUrl == "/lectureTimeTable/edit/1"
		model.bookInstance == ltt

		}
		if(ltt)
		response.redirectUrl == "/lectureTimeTable/show/1"
		else
		  response.redirectUrl == "/lectureTimeTable/edit/1"
}
	void "test delete"() {
		when:
		 Lecture lecture= new Lecture(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE"),userName:'fred',password:'123456').save()
		Stream stream=new Stream(coursename:'CSE').save(flush:true)
		Subject subject=new Subject(name:"computer",stream:new Stream(coursename:'CSE').save(flush:true),year:"First Year").save(flush:true)
		LectureTimeTable ltt=new LectureTimeTable(year:"First Year",peroid:"First Peroid",day:new Date(),lecture:lecture,stream:stream,subject:subject).save(flush:true,failonError:true)
		params.lecture=1
		
		request.method="POST"
		println "dsfsfds=="+params
		controller.delete(params.long('lecture'))
		

		then:
		
		if(ltt)
	response.redirectUrl == "/lectureTimeTable/list"
	else
	response.redirectUrl == "/lectureTimeTable/show"
	}
	
}
