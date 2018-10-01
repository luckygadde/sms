package com.grailstest

import org.springframework.dao.DataIntegrityViolationException

class LectureTimeTableController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def mailserviceService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [lectureTimeTableInstanceList: LectureTimeTable.list(params), lectureTimeTableInstanceTotal: LectureTimeTable.count()]
    }

    def create() {
        [lectureTimeTableInstance: new LectureTimeTable(params)]
    }

    def save() {
		def lectureTimeTableInstance = new LectureTimeTable(params)
//        params.subject.id = params.long('subject.id')
//		 Subject  subject = Subject.get(params.long('student.id'))
		  lectureTimeTableInstance.subject = Subject.get(params.subjectid)
//		def lectureTimeTableInstance = new LectureTimeTable(params)fdgdfgdfgfdgfd
//        lectureTimeTableInstance.lecture = Lecture.get(params.long('lecture.id'))
		lectureTimeTableInstance.lecture = Lecture.get(params.lectureid)
        if (!lectureTimeTableInstance.save(flush: true)) {
            render(view: "create", model: [lectureTimeTableInstance: lectureTimeTableInstance])
            return
        }
		if(lectureTimeTableInstance!=null){
			def emaild=lectureTimeTableInstance.lecture.email
			def lecturename=lectureTimeTableInstance.lecture.firstName
//			mailserviceService.sendSucessMail(emaild,lecturename)
			try {
				
					sendMail {
						to emaild
						subject "Time-Table."
						body "Hi "+lecturename+" \n\n "+
						"Your Time Table has been Scheduled.\n"+
						"Please Check Out in Your Login."
					}

				} catch (Exception e) {
					e.printStackTrace()
				}
			}
        flash.message = message(code: 'default.created.message', args: [message(code: 'lectureTimeTable.label', default: 'LectureTimeTable'), lectureTimeTableInstance.id])
        redirect(action: "show", id: lectureTimeTableInstance.id)
		
    }

    def show(Long id) {
        def lectureTimeTableInstance = LectureTimeTable.get(id)
        if (!lectureTimeTableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lectureTimeTable.label', default: 'LectureTimeTable'), id])
            redirect(action: "list")
            return
        }
        [lectureTimeTableInstance: lectureTimeTableInstance]
    }

    def showTimeTable(Long id){
        def lecture = Lecture.get(id)
        def list =  LectureTimeTable.findAllByLecture(lecture)
        [lectureTimeTableInstanceList: list, lectureTimeTableInstanceTotal: list?.size()]
    }

    def edit(Long id) {
		
        def lectureTimeTableInstance = LectureTimeTable.get(id)
        if (!lectureTimeTableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lectureTimeTable.label', default: 'LectureTimeTable'), id])
            redirect(action: "list")
            return
        }
        [lectureTimeTableInstance: lectureTimeTableInstance]
    }

    def update(Long id, Long version) {
        def lectureTimeTableInstance = LectureTimeTable.get(id)
        if (!lectureTimeTableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lectureTimeTable.label', default: 'LectureTimeTable'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (lectureTimeTableInstance.version > version) {
                lectureTimeTableInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'lectureTimeTable.label', default: 'LectureTimeTable')] as Object[],
                          "Another user has updated this LectureTimeTable while you were editing")
                render(view: "edit", model: [lectureTimeTableInstance: lectureTimeTableInstance])
                return
            }
        }

        lectureTimeTableInstance.properties = params

        if (!lectureTimeTableInstance.save(flush: true)) {
            render(view: "edit", model: [lectureTimeTableInstance: lectureTimeTableInstance])
            return
        }
        flash.message = message(code: 'default.updated.message', args: [message(code: 'lectureTimeTable.label', default: 'LectureTimeTable'), lectureTimeTableInstance.id])
        redirect(action: "show", id: lectureTimeTableInstance.id)
    }

    def delete(Long id) {
        def lectureTimeTableInstance = LectureTimeTable.get(id)
        if (!lectureTimeTableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lectureTimeTable.label', default: 'LectureTimeTable'), id])
            redirect(action: "list")
            return
        }

        try {
            lectureTimeTableInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'lectureTimeTable.label', default: 'LectureTimeTable'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'lectureTimeTable.label', default: 'LectureTimeTable'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def showTimeTable1(Long id){
		def lecture = Lecture.get(id)
		def list =  LectureTimeTable.findAllByLecture(lecture)
		[lectureTimeTableInstanceList: list, lectureTimeTableInstanceTotal: list?.size()]
	}
	
	
}
