package com.grailstest

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@TestFor(StreamController)
@Mock([Stream,LectureTimeTable,Student])
class StreamControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

	void "test index"(){
		when:
		controller.index()
		then:
		response.redirectedUrl == "/stream/list"
	}
	void "test list"(){
		when:
		Stream stream=new Stream(coursename:'CSE').save()
		def model=controller.list(1)
		then:
		model.streamInstanceList==[stream]
		
	}
      void "test save"() {
		
	when:
	
	params.coursename='CSE'
	request.method="POST"
	controller.save()
		 then:
		response.redirectedUrl == "/stream/show/1"
		
    }
	
	void "test show"() {
		when:
		Stream stream=new Stream(coursename:'CSE').save()
		params.coursename=1
		request.method="POST"
		def model=controller.show(params.long('coursename'))

		then:
	
	      if(!stream)
         response.redirectUrl == "/stream/list"
	      else
//		response.redirectUrl == "/book/show"
	     model.streamInstance==[stream]
	}
	
	void "test edit"() {
		when:
		Stream stream=new Stream(coursename:'CSE').save()
		params.coursename=1
		request.method="POST"
		def model=controller.edit(params.long('coursename'))

		then:
		if(stream)
		
//		  response.redirectUrl == "/book/edit/1"
		model.streamInstance==[stream]
		else
		response.redirectUrl == "/stream/list"
	
	}
	
	void "test update"() {
		when:
		Stream stream=new Stream(coursename:'CSE').save()
		params.coursename=1
		params.version=1
		request.method="POST"
		def model=controller.update(params.long('coursename'),params.long('version'))

		then:
		
		if (stream.version > params.version) {
		response.redirectUrl == "/stream/edit/1"
		model.streamInstance == stream

		}
		if(stream)
		response.redirectUrl == "/stream/show/1"
		else
		  response.redirectUrl == "/stream/edit/1"
}
	
	void "test delete"() {
		when:
		  Stream stream=new Stream(coursename:'CSE').save()
		params.coursename=1
		
		request.method="POST"
		controller.delete(params.long('coursename'))
		

		then:
		
		if(stream)
	response.redirectUrl == "/stream/list"
	else
	response.redirectUrl == "/stream/show"
	}
}
