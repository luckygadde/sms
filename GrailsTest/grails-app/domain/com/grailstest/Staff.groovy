package com.grailstest

class Staff {

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
	String stream
	String userName
	String password
    StaffType staff =  StaffType.ADMINISTRATON
    static constraints ={
        firstName blank:false, nullable:false
        lastName blank:false, nullable:false
        dob blank:false, nullable:true
        gender blank:false, nullable:false
        address blank:false, nullable:false
        email blank:false, nullable:false,email :true,unique: true
        phone blank:false, nullable:false
		userName blank:false, nullable:false,unique: true
		password blank:false, nullable:false
    }

    static mapping ={
    }
		static transients = ['domaintype','age','studyyear','stream']
}
enum StaffType {
    TEACHING, NONTEACHING,ADMINISTRATON
}

