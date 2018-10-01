package com.grailstest

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@TestFor(TransportController)
@Mock([Transport,Student])
class TransportControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

     void "test save"() {
		
	when:
	Transport transpot= new Transport(stopName:'ecil',student:new Student(firstName:"sampath").save()).save()
	Student student=new Student(firstName:"sampath",transportfacility:"Yes").save()
	params.stopName=1
	params.student=1
	
	request.method="POST"
	println"save transport params=="+params
	controller.save()
		 then:
		 if(transpot)
		response.redirectedUrl == "/transport/show/1"
		else
		response.redirectedUrl == "/transport/create"
    }
	 void "test show"() {
		 when:
		Transport transpot= new Transport(stopName:'ecil').save()
		 params.stopName=1
		 println params
		def res= controller.show(params.long('stopName'))
 
		 then:
		 if(!transpot)
	 response.redirectUrl == "/transport/list"
	 else
//	 response.redirectUrl == "/transport/show"
	 res.transportInstance==transpot
	 }
	 
	 void "test edit"() {
		 when:
		Transport transpot =new Transport(stopName:'ecil').save()
		 params.stopName=1
		 request.method="POST"
		 println params
		 def res=controller.edit(params.long('stopName'))
		 
 
		 then:
		 if(!transpot)
	 response.redirectUrl == "/transport/list"
	 else
//	 response.redirectUrl == "/transport/edit/1"
	 res.transportInstance==transpot
	 }
	 
	 void "test update"() {
		 when:
		Transport transpot= new Transport(stopName:'ecil').save()
		 params.stopName=1
		 params.version=1
		 request.method="PUT"
		 println "dsfsfds=="+params
		 controller.update(params.long('stopName'),params.long('version'))
		 
 
		 then:
		 if (transpot.version > params.version) {
			 response.redirectUrl == "/transport/edit/1"
			 model.transpot == transpot

		 }
		 if(transpot)
	 response.redirectUrl == "/transport/show/1"
	 else
	 response.redirectUrl == "/transport/edit/1"
	 }
	 
	 void "test delete"() {
		 when:
		Transport transpot= new Transport(stopName:'ecil').save()
		 params.stopName=1
		 
		 request.method="DELETE"
		 println "dsfsfds=="+params
		 controller.delete(params.long('stopName'))
		 
 
		 then:
		 
		 if(transpot)
	 response.redirectUrl == "/transport/list"
	 else
	 response.redirectUrl == "/transport/show"
	 }
}
