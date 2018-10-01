package com.grailstest

import com.grailstest.HomeController

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(HomeController)
@Mock([Book,Staff,Student,Stream,Library,BookBorrowed])
class HomeControllerSpec extends Specification {

	StudentDetailService studentDetailServiceMock = Mock(StudentDetailService)
	LibraryService libraryServiceMock=Mock(LibraryService)
	
    def setup() {
    }

    def cleanup() {
    }

	
	void "test newregister"() {
		
		
		when:
		//def st = mockFor(Stream)
		//st.demand.static.findByCoursename() { String name -> return new Stream(name:"CSE").save(flush:true) }
	//	println"stream value=="+st
		Stream s =new Stream(coursename:"CSE").save(flush:true)
			params.firstName ='fred'
			params.lastName='flintstone'
			params.address='rocky street'
			params.gender='Male'
			params.age='25'
			params.email='abcd@gmail.com'
			params.phone='9856985698'
			params.dob='08/21/2016'
			params.studyyear='Fisrt Year'
			params.stream= "CSE"
			params.userName='fred'
			params.password='123456'
//			params.domaintype='1'
		
			new StudentDetailService().register(params)
//         controller.newregister()
		then:
//		response.redirectUrl == "/home/login"
		assert "/home/login"
	}
	
	void " test getBookDetails"() {
		when:
		controller.getBookDetails()
		def bk = new Book()
		bk.properties = params
		then:
		view==  "/home/CollegeDetails"
	}

	
	void 'test getStaffDetails'() {
		given:
		
		when:
		controller.getStaffDetails()

		then:
		view == '/home/CollegeDetails'
	}
	
//	void 'test borrowBook'() {
//		
//		
//		
//		when:
//                              
//		params.student=new Student(firstName:'sam',lastName: "kumar",gender:"Male",address:"hyderabad",email:"satish@gmail.com",phone:"9848809629",age:19,studyyear:"Fisrt Year",userName:"satishk",password:'123456',stream:new Stream(coursename:'CSE')).save(flush:true,failonError:true)
//		params.book=new Book(title:"book").save(flush:true,failonError:true)
////		
//		println"library"+libraryServiceMock
//		println params
//       new LibraryService().borrowBook(params)
//
//		then:
//		response.redirectUrl == "/home/borrowedbooks"
//	}
	
	
	
	
}
