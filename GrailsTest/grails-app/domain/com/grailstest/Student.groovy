package com.grailstest

class Student {
    String firstName
    String lastName
    Date dob = new Date()
    String gender
    String address
    String email
    String phone
    int age
    String studyyear
    int noOfBooks=0;
	String transportfacility="No"
	String fee="Pending"
	String domaintype
	String userName
	String password
    static hasMany =[books:Book]
//	static belongsTo =[lectures:Lecture,stream:Stream]
    static belongsTo =[stream:Stream]
	

    static constraints ={
        firstName blank:false, nullable:false
        lastName blank:false, nullable:false
        dob blank:false, nullable:false
        gender blank:false, nullable:false
        address blank:false, nullable:false
        email blank:false, nullable:false,email :true,unique: true
        phone blank:true, nullable:true
        age min: 18,max:65
        studyyear blank:false, nullable:false
        noOfBooks blank:true, nullable:true
		userName blank:false, nullable:false,unique: true
		password blank:false, nullable:false
    }
    static mapping ={
        //table "student"
        //version(true)
		sort "firstName"
		
    }
	static transients = ['domaintype']
	

}
