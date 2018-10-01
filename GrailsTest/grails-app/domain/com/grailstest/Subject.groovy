package com.grailstest

class Subject {


    String name
    String year
    static belongsTo =[stream:Stream]

    static constraints ={
        name blank:false, nullable:false
        year blank:false, nullable:false
    }

    static mapping ={

        //table "subject"
		sort "name"
    }
}
