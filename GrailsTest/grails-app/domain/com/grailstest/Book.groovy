package com.grailstest

class Book {
	String title
	String authorName
	int copies = 1;

	static  belongsTo =[library:Library]

	static constraints = {
		title blank:false ,nullable:false
		authorName blank:false,nullable:false
		copies blank:false,nullable:false, matches:/[0-9]+/
		
		authorName(unique:['title'])
	}

	static mapping ={
		//table "book"
		//version(true)
	}
	def beforeInsert() {

	}
}
