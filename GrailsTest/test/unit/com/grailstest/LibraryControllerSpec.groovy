package com.grailstest

import javax.swing.text.View;

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@TestFor(LibraryController)
@Mock([Library])
class LibraryControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }
    void "test index"(){
		when: 
		controller.index()
		then:
		response.redirectedUrl == "/library/list"
    }
	void "test list"(){
		when:
		Library library=new Library(booksCount:'10',signUpDate:new Date()).save(flush:true,failonError:true)
		def model=controller.list(1)
		then:
		model.libraryInstanceList==[library]
		
	}
//	void "test create"(){
//		
//	Library	libraryInstance=new Library(booksCount:'10',signUpDate:new Date()).save()
//	params.booksCount='10'
//	params.signUpDate=new Date()
//		def model=controller.create()
//		
//		
//	}
    void "test save"() {
		
	when:
	Library library=new Library(booksCount:'10',signUpDate:new Date()).save(flush:true,failonError:true)
	
	params.booksCount='10'
	params.signUpDate=new Date()
	
	request.method="POST"
	controller.save()
		 then:
		 if(library)
		response.redirectedUrl == "/library/show/1"
		else
		view == '/library/create'
    }
	void "test show"() {
		when:
	Library library=new Library(booksCount:'10',signUpDate:new Date()).save(flush:true,failonError:true)
		params.booksCount=1
		def res=controller.show(params.long('booksCount'))

		then:
		if(library)
		res.libraryInstance=library
		else
		response.redirectUrl == "/library/list"
	}
	
	void "test edit"() {
		when:
		Library library=new Library(booksCount:'10',signUpDate:new Date()).save(flush:true,failonError:true)
		params.booksCount=1
		def res=controller.show(params.long('booksCount'))

		then:
		if(library)
		res.libraryInstance=library
		else
		response.redirectUrl == "/library/list"
	}
}
