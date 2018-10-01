package com.grailstest

class Library {

    Date signUpDate = new Date()
    Long booksCount=0
	static hasMany =[book:Book,bookBorrowed:BookBorrowed]
    static constraints ={
        booksCount blank:false,nullable:false
    }

    static mapping = {
//        table "library"
    }

}
