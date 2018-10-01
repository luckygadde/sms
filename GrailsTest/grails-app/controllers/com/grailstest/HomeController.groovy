package com.grailstest

import org.grails.datastore.mapping.query.Query;
import org.h2.engine.SessionFactory;


class HomeController {


    def studentDetailService
    def libraryService
	def lectureDetailService
	def staffDetailService


    def index() {
      render(view: "index")
    }
    def home(){
    }
	def home1(){
	}
   



    def getregister(){

        redirect(action:'Registration')
    }
    def Registration(){

    }
    def Register(){
        def domainval=params.domaintype

		def content
   
   if(domainval as int==1){
		content = studentDetailService.register(params)
   }
   
   if(domainval as int==2){
	   content = lectureDetailService.register(params)
  }
   if(domainval as int==3){
	   content = staffDetailService.register(params)
  }
   if (content.hasErrors()) {
//	   //not saved

	   render(view:'Registration', model:[content:content])
   } else {
	   //saved
	  if(domainval as int==1){
		  redirect(uri: "/home/login")
        }
        if(domainval as int==2){
			redirect(uri: "/home/login")
        }
        if(domainval as int==3){
			redirect(uri: "/home/login")
        }
   }
    }


   


    def getStaffDetails(){
        def sf = new Staff()
        sf.properties = params

        render (view: "CollegeDetails", model: [result3:sf.list()])
    }

    
    def getBookDetails(){
        def bk = new Book()
        bk.properties = params

        render (view: "CollegeDetails", model: [bookresult:bk.list(sort: "title",)])
    }


    def gotoLibrary(){
		
		
        redirect(action:'LibraryBooks')
    }
    def LibraryBooks(){
		
		def books= Book.createCriteria()
		def results = books.list {
			gt("copies",0)
			
		}
		[books:results]
    }
    def borrowBook(){
        libraryService.borrowBook(params)
	   
        redirect(action:'borrowedbooks')
	
	  
    }
    def borrowedbooks(){
        def lib = Library.get(1)
         
        lib.bookBorrowed.each{
            println  it
        }
		
        render (view: "borrowedbooks", model: [library:lib])
    }



    def loadsubject(String stremid){

        sleep(2000)

        def strmid=Stream.get(stremid)

        def subCategories = []
        if ( strmid != null) {
            subCategories = Subject.findAllByStream(strmid,[order:'coursename'])
        }
        render g.select(id:'subCategory', name:'subCategory.id',
                from:subCategories, optionKey:'id',optionValue:'name', noSelection:['':'-Choose your subject-']
        )
    }

	
	def returnBooktoLibrary(){
		redirect(action:'returnbooktolibrary')
	}
	def returnbooktolibrary(){
		List<BookBorrowed> bb=BookBorrowed.findAllByReturned(false)
		
		[booksBorrowed:bb]
		
	}
	
	def loadbooks(String studtid){
		def student = Student.get(studtid as long) // getting all details from student class by sending studentid
		  def books=student.books 
				sleep(2000)

				def subCategories = []
				if ( books != null) {
					subCategories = books
					
				}
				render g.select(name:"loadBooks",id:"id",  optionKey:'id',optionValue:'title',from:subCategories, noSelection:['':'-Choose your Book-']
				)
			}
	
	def returnBook(){
		
		libraryService.returnbook(params)
		redirect(action:'getBookDetails')
	}
	def verifyemail(String emailaddrss,int domaintyp){
		def result
		if(domaintyp==1 as Integer){
			def student= Student.findByEmail(emailaddrss)
			
			/*Student.find{             // we can write these away also to find 
				email==emailaddrss
			}*/
			
			if(student){
				result= "Email Already Exist"
			}else{
			result= "Email Available"
			}
			render result;
		}
		
		if(domaintyp==2 as Integer){
		
			def lecture= Lecture.findByEmail(emailaddrss)
			
			/*Lecture.find{             // we can write these away also to find
				email==emailaddrss
			}*/
			
			if(lecture){
				result= "Email Already Exist"
			}else{
			result= "Email Available"
			}
			render result;
	}
		if(domaintyp==3 as Integer){
		
			def staff= Staff.findByEmail(emailaddrss)
			
			/*Staff.find{             // we can write these away also to find
				email==emailaddrss
			}*/
			
			if(staff){
				result= "Email Already Exist"
			}else{
			result= "Email Available"
			}
			render result;
	}
		
	} 
	def verifyusername(String username,int domaintyp){
		def result
		if(domaintyp==1 as Integer){
			def student= Student.findByUserName(username)
			if(student){
				result= "UserName Already Exist"
			}else{
			result= "UserName Available"
			}
			render result;
		}
		
		if(domaintyp==2 as Integer){
		
			def lecture= Lecture.findByUserName(username)
			
			/*Lecture.find{             // we can write these away also to find
				email==emailaddrss
			}*/
			
			if(lecture){
				result= "UserName Already Exist"
			}else{
			result= "UserName Available"
			}
			render result;
	}
		if(domaintyp==3 as Integer){
		
			def staff= Staff.findByUserName(username)
			
			/*Staff.find{             // we can write these away also to find
				email==emailaddrss
			}*/
			
			if(staff){
				result= "UserName Already Exist"
			}else{
			result= "UserName Available"
			}
			render result;
	}
		
	}
	
	
	
  def loginPage(){
	  redirect(action:'Login')
  }
  def Login(){
      println "---------------Login --------------------"
  }
  
  def LoginVerify(){
	  
	  def userName=params.userName
	  def password=params.password
	  def domaintype=params.domaintype
	  
	  println "username=="+userName
	  println "password=="+password
	  println "domaintype=="+domaintype
	  
	  
	  if(domaintype as int==1){
		  
		  def student=Student.findByUserNameAndPassword(userName,password)
		  
		  if(student){
			  redirect ( controller:'student',action:'showsinglestudent', id:student.id)
		  }else{
		  flash.message = "Given UserName/Password is incorrect.Please try again."
		  redirect(action:'Login')
		  }
	   }
	  if(domaintype as int==2){
		  def lecture=Lecture.findByUserNameAndPassword(userName,password)
		  
		  if(lecture){
			  redirect ( controller:'lecture',action:'showsinglelecture', id:lecture.id)
		  }
		  else{
			  flash.message = "Given UserName/Password is incorrect.Please try again."
			  redirect(action:"login")
			  }
	   }
	  if(domaintype as int==3){
		  def staff=Staff.findByUserNameAndPassword(userName,password)
		  if(staff){
			  render(view:"CollegeDetails")
		  }else{
		  flash.message = "Given UserName/Password is incorrect.Please try again."
		  redirect(action:'Login')
		  }
	   }
	  
  }
  
}
