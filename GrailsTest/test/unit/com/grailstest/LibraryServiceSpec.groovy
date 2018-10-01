package com.grailstest

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(LibraryService)
@Mock([Student,Book,Stream,Library,BookBorrowed,ReturnBook])
class LibraryServiceSpec extends Specification {
	LibraryService libraryService=Mock(LibraryService)
    def setup() {
    }

    def cleanup() {
    }

    void "test borrowBook"() {
		when:
		Book b=new Book(title:'fred',authorName:"sampath",copies:25,library:new Library(booksCount:0).save()).save(flush:true,failonError:true)
		Student s=new Student(firstName:'sam',lastName: "kumar",gender:"Male",address:"hyderabad",email:"satish@gmail.com",phone:"9848809629",age:19,studyyear:"Fisrt Year",userName:"satishk",password:'123456',stream:new Stream(coursename:'CSE')).save(flush:true,failonError:true)
		BookBorrowed bb=new BookBorrowed(student:s, book:b).save()
		def params=[:]
		params.library=new Library(booksCount:0).save()
		params.student=1
		params.book=1
		service.borrowBook(params)
		then:
		assert 'borrowedbooks'
    }
	
	void "test returnbook"() {
		when:
		Book b=new Book(title:'fred',authorName:"sampath",copies:25,library:new Library(booksCount:0).save()).save(flush:true,failonError:true)
		Student s=new Student(firstName:'sam',lastName: "kumar",gender:"Male",address:"hyderabad",email:"satish@gmail.com",phone:"9848809629",age:19,studyyear:"Fisrt Year",userName:"satishk",password:'123456',stream:new Stream(coursename:'CSE')).save(flush:true,failonError:true)
		BookBorrowed bb=new BookBorrowed(student:s, book:b).save()
		def params=[:]
		params.library=new Library(booksCount:0).save()
		params.student=1
		params.book=1
		service.returnbook(params)
	
		then:
		assert 'getBookDetails'
	}
}
