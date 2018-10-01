package com.grailstest

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@TestFor(LectureDetailService)
@Mock([Lecture,Stream])
class LectureDetailServiceSpec extends Specification {
	LectureDetailService lectureDetailService=Mock(LectureDetailService)

    def setup() {
    }

    def cleanup() {
    }
	
	void "test serviceMethod"() {
	}
        void "test register"() {
		when:
		def params=[:]
		Stream s = new Stream(coursename:"CSE").save()
		params.firstName ='fred'
		params.lastName='flintstone'
		params.address='rocky street'
		params.gender='Male'
		params.email='abcd@gmail.com'
		params.phone='9856985698'
		params.dob='08/21/2016'
		params.studyyear='Fisrt Year'
		params.stream= "CSE"//new Stream(coursename:"CSE").save(flush:true)
		params.userName='fred'
		params.password='123456'
		
		println "=-=-tc=-=-"+params
		
		service.register(params)
		then:
		
		assert '/home/login'
    }
}
