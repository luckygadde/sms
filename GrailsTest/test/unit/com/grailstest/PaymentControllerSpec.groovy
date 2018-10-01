package com.grailstest

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import com.grailstest.PaymentController
import spock.lang.Specification
import grails.test.mixin.TestFor

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@TestFor(PaymentController)
@Mock([Payment,Student,Stream])
class PaymentControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }
	
	void "test index"(){
		when:
		controller.index()
		then:
		response.redirectedUrl == "/payment/list"
	}
	void "test list"(){
		when:
		Student student= new Student(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456',age:25).save(flush:true,failonError:true)
		Payment payment=new Payment(amount:100.0,student:student).save(flush:true,failonError:true)
		def model=controller.list(1)
		then:
		model.paymentInstanceList==[payment]
		
	}

    void "test save"() {
		
	when:
	Student student= new Student(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456',age:25).save(flush:true,failonError:true)
	params.amount=1000.0
	params.studentid=1
	request.method="POST"
	controller.save()
		 then:
		 
		response.redirectedUrl == "/payment/show/1"
		
		
    }
	
	void "test show"() {
		when:
		Student student= new Student(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456',age:25).save(flush:true,failonError:true)
		Payment payment=new Payment(amount:100.0,student:student).save(flush:true,failonError:true)
			params.amount=1
			println params
	def model=controller.show(params.long('amount'))

	then:
	if(!payment)
	response.redirectUrl == "/payment/list"
	else
//		response.redirectUrl == "/book/show"
	model.paymentInstance==[payment]
	
	}
	void "test edit"() {
		when:
		Student student= new Student(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456',age:25).save(flush:true,failonError:true)
		Payment payment=new Payment(amount:100.0,student:student).save(flush:true,failonError:true)
			params.amount=1
			println params
		def model=controller.edit(params.long('amount'))

		then:
		if(payment)
		
//		  response.redirectUrl == "/book/edit/1"
		model.paymentInstance==[payment]
		else
		response.redirectUrl == "/payment/list"
	
	}
	
	void "test update"() {
		when:
		Student student= new Student(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456',age:25).save(flush:true,failonError:true)
		Payment payment=new Payment(amount:100.0,student:student).save(flush:true,failonError:true)
			params.amount=1
			params.version=1
			println params
		request.method="PUT"
		def model=controller.update(params.long('amount'),params.long('version'))

		then:
		
		if (payment.version > params.version) {
		response.redirectUrl == "/payment/edit/1"
		model.paymentInstance == payment

		}
		if(payment)
		response.redirectUrl == "/payment/show/1"
		else
		  response.redirectUrl == "/payment/edit/1"
}
	
	void "test delete"() {
		when:
	Student student= new Student(firstName :'fred',lastName:'flintstone',address:'rocky street',gender:'Male',email:'abcd@gmail.com',phone:'9856985698',dob:new Date(),studyyear:"First Year",stream:new Stream(coursename:"CSE").save(),userName:'fred',password:'123456',age:25).save(flush:true,failonError:true)
		Payment payment=new Payment(amount:100.0,student:student).save(flush:true,failonError:true)
			params.amount=1
		
		request.method="DELETE"
		println "dsfsfds=="+params
		controller.delete(params.long('amount'))
		

		then:
		
		if(payment)
	response.redirectUrl == "/payment/list"
	else
	response.redirectUrl == "/payment/show"
	}
}
