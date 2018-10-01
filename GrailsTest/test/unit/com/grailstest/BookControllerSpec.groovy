package com.grailstest

import com.grailstest.BookController
import spock.lang.Specification
import grails.test.mixin.TestFor
/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(BookController)
@Mock([Book,Library])
class BookControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }


	
	void setupData() {
		new Book(title:'fred',authorName:"sampath",copies:30).save(flush: true)
	}
	void "test index"(){
		when:
		controller.index()
		then:
		response.redirectedUrl == "/book/list"
	}
	void "test list"(){
		when:
		Book book=new Book(title:'fred',authorName:"sampath",copies:30,library:new Library(booksCount:0).save()).save()
		def model=controller.list(1)
		then:
		response.redirectedUrl == "/home/getBookDetails"
		
	}
	void "test saving"() {
	
    when:
	Book book=new Book(title:'fred',authorName:"sampath",copies:30,library:new Library(booksCount:0).save()).save()
	params.title='fred'
	params.authorName="sampath"
	params.copies=30
	params.library=new Library(booksCount:0).save()
	request.method="POST"
	
	controller.save()
		 then:
		 if(book){
		response.redirectedUrl == "/book/show/1"
		 }else{
		response.redirectUrl == "/book/create"
		 }
	}
	
	void "test show"() {
		when:
		Book book=new Book(title:'fred',authorName:"sampath",copies:30,library:new Library(booksCount:0).save()).save()
		params.title=1
		def model=controller.show(params.long('title'))

		then:
		if(!book)
		response.redirectUrl == "/book/list"
		else
//		response.redirectUrl == "/book/show"
		model.bookInstance==[book]
	}
	
	void "test edit"() {
		when:
		Book book=new Book(title:'fred',authorName:"sampath",copies:30,library:new Library(booksCount:0).save()).save()
		params.title=1
		def model=controller.edit(params.long('title'))

		then:
		if(book)
		
//		  response.redirectUrl == "/book/edit/1"
		model.bookInstance==[book]
		else
	    response.redirectUrl == "/book/list"
	
	}
	
	void "test update"() {
		when:
		Book books=new Book(title:'fred',authorName:"sampath",copies:30,library:new Library(booksCount:0).save()).save()
		params.title=1
		params.version=1
		request.method="POST"
		def model=controller.update(params.long('title'),params.long('version'))

		then:
		
		if (books.version > params.version) {
		response.redirectUrl == "/book/edit/1"
		model.bookInstance == books

		}
		if(books)
		response.redirectUrl == "/book/show/1"
		else
	  	response.redirectUrl == "/book/edit/1"
}
	
	void "test delete"() {
		when:
	  	Book books=new Book(title:'fred',authorName:"sampath",copies:30,library:new Library(booksCount:0).save()).save()
		params.title=1
		
		request.method="POST"
		controller.delete(params.long('title'))
		

		then:
		
		if(books)
	response.redirectUrl == "/book/list"
	else
	response.redirectUrl == "/book/show"
	}
	
}
