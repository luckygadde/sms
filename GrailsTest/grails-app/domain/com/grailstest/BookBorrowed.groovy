package com.grailstest

class BookBorrowed {

    Student student
    Book book
    Date borrowed = new Date()
	Boolean returned=false
    static constraints = {
    }
}
