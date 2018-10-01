package com.grailstest

class Stream {
    String coursename
    static hasMany =[lectures:Lecture,subjects:Subject,ltt:LectureTimeTable]
    static constraints ={
        coursename blank :false,nullable:false
    }
    static mapping ={
        //table	"stream"
        //version true
		sort "coursename"
    }
}
