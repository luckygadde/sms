package com.grailstest

class LectureTimeTable {

    String year
    String peroid
    Stream  stream
    Subject subject
    Lecture lecture
	String day
    static constraints ={
        lecture blank:false,nullable:false
        stream blank:false,nullable:false
        subject blank:false,nullable:false
        year blank:false,nullable:false
		day blank:false,nullable:false
		peroid blank:false,nullable:false
		
	
		day(unique: ['peroid','stream'])
		lecture(unique: ['day','peroid'])
    }

}
