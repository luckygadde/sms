import com.grailstest.Stream
import com.grailstest.Staff
import com.grailstest.StaffType
import com.grailstest.Student
import com.grailstest.Subject
import com.grailstest.Library
import com.grailstest.Book
import com.grailstest.Lecture

class BootStrap {

    def init = { servletContext ->
        Library lib
        Random random = new Random()
        if(Library.count()==0){
            lib = new Library(booksCount: 0 ).save(flush:true)
        }
        else{
            lib = Library.get(1)
        }
        if(Stream.count()==0){
            ['CSE','EEE','ECE','MECH','CIVIL'].each{
                new Stream(coursename: it).save()
            }
        }
        def authors =['sachin','sourav','ramesh','abhinav','kumar']
        def books =['Computer Networks','Digital Signaturs','Computer Graphics','Neural Networks','EDC']
        books.eachWithIndex{String book,int i->
            if(!Book.findByTitleAndAuthorName(book,authors[i])){
                Book bk = new Book(title:book,authorName:authors[i],copies:random.nextInt(30),library : lib)

				lib.booksCount = lib.booksCount+bk.copies
				
				bk.setLibrary(lib)
				
                bk.save()
            }

        }

        def emails=['s1@s.com','s2@s.com','s3@s.com','s4@s.com','s5@s.com']
        def phoneNumbers = ['512-420-8725','140-208-4644','782-539-4327','320-286-4575','182-544-7521']
        emails.eachWithIndex{String email,int i->
            Lecture lecture = Lecture.findByEmail(email);
            if(!lecture){
                lecture = new Lecture()
                lecture.firstName = authors[i]
                lecture.lastName  = authors[i]
                lecture.gender  = 'Male'
                lecture.address = "Street No ${i}"
                lecture.email = email
                //lecture.dob  = new Date(01,01,1987) //(new Date()..new Date(2014-1900,5,1)).toList().sort{Math.random()}[0]
                lecture.staff =  StaffType.TEACHING
                Stream stream = Stream.findByCoursename("CSE")
                lecture.stream = stream
				lecture.phone=phoneNumbers[i]
				lecture.userName=authors[i]
				lecture.password='123456'
               // lecture.save()​
                lecture.save()
            }
        }
        emails.eachWithIndex{String email,int i->
            Student student = Student.findByEmail(email)
            if(!student){
                student = new Student()
                student.firstName = authors[i]
                student.lastName  = authors[i]
                student.gender  = 'Male'
                student.address = "Street No ${i}"
                student.email = email
//                student.phone = "9866683810"
				student.phone=phoneNumbers[i]
                student.age =19
                student.noOfBooks =10
                //student.dob  = new Date(01,01,1987)//(new Date()..new Date(2014-1900,5,1)).toList().sort{Math.random()}[0]
                student.stream =Stream.findByCoursename("CSE")
                student.studyyear = "First year"
				student.userName=authors[i]
				student.password='123456'
                student.save()
            }
        }


        Staff std=Staff.findByEmail('sampath@gmail.com')?: new Staff(firstName: "sampath", lastName: "kumar",gender:"Male",address:"hyderabad",
                email:"sampath@gmail.com",phone:"9848809229",dob:new Date(01,01,1989),userName:"sampath",password:'123456')
                std.save()
				
        Student student= Student.findByEmail('sampath@gmail.com')?:new Student(firstName: "sampath", lastName: "kumar",gender:"Male",address:"hyderabad",
                email:"sampath@gmail.com",phone:"9848809229",age:19,studyyear:"Fisrt Year",userName:"sampath",password:'123456')
        student.setStream(Stream.findByCoursename('CSE'))
        student.save()
		
        def subjects = ['Basic	Electronics','Digital Systems','Object Oriented Programming','Mathematical foundation of Computer Science', 'ICT Tools and Security','Community Services','Entrepreneurship','Applied Mathematics']
        subjects.eachWithIndex{String sub,int i->
            def subject1 = Subject.findByName(sub)?: new Subject(name: sub, year:"${(i+1<4)?i:2} year",stream:Stream.findByCoursename("CSE"))
			def subject2 = Subject.findByName(sub)?: new Subject(name: sub, year:"${(i+1<4)?i:2} year",stream:Stream.findByCoursename("EEE"))
			 subject1.save()
			 subject2.save()
        }
		
		
    }
    def destroy = {
    }
}
