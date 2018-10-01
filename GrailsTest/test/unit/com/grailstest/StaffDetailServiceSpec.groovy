package com.grailstest

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(StaffDetailService)
@Mock([Staff])
class StaffDetailServiceSpec extends Specification {
StaffDetailService staffDetailService=Mock(StaffDetailService)
    def setup() {
    }

    def cleanup() {
    }

      void "test register"() {
		when:
		def params=[:]
		params.firstName ='fred'
		params.lastName='flintstone'
		params.address='rocky street'
		params.gender='Male'
		params.email='abcd@gmail.com'
		params.phone='9856985698'
		params.dob='08/21/2016'
		params.userName='fred'
		params.password='123456'
		
		println "=-=-tc=-=-"+params
		
		service.register(params)
		then:
		
		assert '/home/login'
    }
}
