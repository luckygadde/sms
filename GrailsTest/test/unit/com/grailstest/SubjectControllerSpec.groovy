package com.grailstest

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@TestFor(SubjectController)
@Mock([Subject,Stream,LectureTimeTable])
class SubjectControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

      void "test save"() {
		
	when:
	params.name='computer'
	params.year='1year'
	params.stream=new Stream(coursename:"CSE").save()
	request.method="POST"
	controller.save()
		 then:
		response.redirectedUrl == "/subject/show/1"
		
    }
	
	void "test show"() {
		when:
		Stream stream=new Stream(coursename:"CSE").save()
	Subject subject=new Subject(name:'computer',stream:stream,year:'1year').save()
		params.name=1
		def res=controller.show(params.long('name'))

		then:
		if(subject)
		res.subjectInstance=subject
		else
	    response.redirectUrl == "/subject/list"
	}
	void "test edit"() {
		when:
		Stream stream=new Stream(coursename:"CSE").save()
	    Subject subject=new Subject(name:'computer',stream:stream,year:'1year').save()
		params.name=1
		def res=controller.show(params.long('name'))

		then:
		if(subject)
		res.subjectInstance=subject
		else
	    response.redirectUrl == "/subject/list"
	}
	
	void "test update"() {
		when:
		Stream stream=new Stream(coursename:"CSE").save()
	    Subject subject=new Subject(name:'computer',stream:stream,year:'1year').save()
		params.name=1
		params.version=1
		request.method="POST"
		println "dsfsfds=="+params
		def model=controller.update(params.long('name'),params.long('version'))

		then:
		
		if (subject.version > params.version) {
		response.redirectUrl == "/subject/edit/1"
		model.subjectInstance == subject

		}
		if(subject)
		response.redirectUrl == "/subject/show/1"
		else
		  response.redirectUrl == "/subject/edit/1"
}

	void "test delete"() {
		when:
		  Stream stream=new Stream(coursename:"CSE").save()
	    Subject subject=new Subject(name:'computer',stream:stream,year:'1year').save()
		params.name=1
		
		request.method="POST"
		println "dsfsfds=="+params
		controller.delete(params.long('name'))
		

		then:
		
		if(subject)
	response.redirectUrl == "/subject/list"
	else
	response.redirectUrl == "/subject/show"
	}
}
