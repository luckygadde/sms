package com.grailstest

import org.springframework.dao.DataIntegrityViolationException

class LectureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
   def mailserviceService
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [lectureInstanceList: Lecture.list(params), lectureInstanceTotal: Lecture.count()]
    }

    def create() {
        [lectureInstance: new Lecture(params)]
    }

    def save() {
        def lectureInstance  = new Lecture(params)

        if (!lectureInstance.save(flush: true)) {
			//redirect(action: "show", id: 1)
            render(view: "create", model: [lectureInstance: lectureInstance])
            return
        }
//		def emaild=lectureInstance.email
//		def lecturename=lectureInstance.firstName
//		def domain=2
//		println emaild
//		mailserviceService.sendSucessMail(emaild,lecturename,domain)
        flash.message = message(code: 'default.created.message', args: [message(code: 'lecture.label', default: 'Lecture'), lectureInstance.id])
        redirect(action: "show", id: lectureInstance.id)
    }

    def show(Long id) {
        def lectureInstance = Lecture.get(id)
        if (!lectureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lecture.label', default: 'Lecture'), id])
            redirect(action: "list")
            return
        }
        [lectureInstance: lectureInstance]
    }

    def edit(Long id) {
        def lectureInstance = Lecture.get(id)
        if (!lectureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lecture.label', default: 'Lecture'), id])
            redirect(action: "list")
            return
        }
        [lectureInstance: lectureInstance]
    }

    def update(Long id, Long version) {
        def lectureInstance = Lecture.get(id)
        if (!lectureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lecture.label', default: 'Lecture'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (lectureInstance.version > version) {
                lectureInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'lecture.label', default: 'Lecture')] as Object[],
                        "Another user has updated this Lecture while you were editing")
                render(view: "edit", model: [lectureInstance: lectureInstance])
                return
            }
        }

        lectureInstance.properties = params

        if (!lectureInstance.save(flush: true)) {
            render(view: "edit", model: [lectureInstance: lectureInstance])
            return
        }
        flash.message = message(code: 'default.updated.message', args: [message(code: 'lecture.label', default: 'Lecture'), lectureInstance.id])
        redirect(action: "show", id: lectureInstance.id)
    }

    def delete(Long id) {
        def lectureInstance = Lecture.get(id)
        if (!lectureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lecture.label', default: 'Lecture'), id])
            redirect(action: "list")
            return
        }

        try {
			
			def deletequry=LectureTimeTable.findAllByLecture(lectureInstance)

			if(deletequry){
				
				deletequry.each{
					it.delete(flush: true)
					
					}
            lectureInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'lecture.label', default: 'Lecture'), id])
            redirect(action: "list")
			}else{
			lectureInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'lecture.label', default: 'Lecture'), id])
			redirect(action: "list")
			}
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'lecture.label', default: 'Lecture'), id])
            redirect(action: "show", id: id)
        }
    }
	def showsinglelecture(Long id) {
		def lectureInstance = Lecture.get(id)
		if (!lectureInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'lecture.label', default: 'Lecture'), id])
			redirect(action: "list")
			return
		}
		[lectureInstance: lectureInstance]
	}
	
}
