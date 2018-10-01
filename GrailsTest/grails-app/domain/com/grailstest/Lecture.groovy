package com.grailstest

class Lecture {

    String firstName
    String lastName
    String gender
    String address
    String email
    String phone
    Date dob = new Date()
	String domaintype
	int age
	String studyyear
	String userName
	String password
//    LectureTimeTable ltt
    StaffType staff =  StaffType.TEACHING
    static belongsTo =[stream:Stream]
    static constraints ={
        firstName blank:false, nullable:false
        lastName blank:false, nullable:false
        dob blank:false, nullable:true
        gender blank:false, nullable:false
        address blank:false, nullable:false
        email blank:false, nullable:false,email :true,unique: true
        phone blank:true, nullable:true
//        ltt blank:true, nullable:true
		userName blank:false, nullable:false,unique: true
		password blank:false, nullable:false
		stream nullable:true
    }

    static mapping ={
        //table "lecture"
		sort "firstName"
    }
	static transients = ['domaintype','age','studyyear']
}
