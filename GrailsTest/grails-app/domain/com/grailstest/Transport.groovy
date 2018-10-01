package com.grailstest

class Transport {
 String stopName
 static hasMany =[student:Student]

 static constraints = {
//	 student cascade: 'all-delete-orphan'
	 stopName blank:false,nullable:false,unique: true
	

 }	
 
}
