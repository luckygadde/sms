package com.grailstest

import org.springframework.dao.DataIntegrityViolationException

class StreamController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [streamInstanceList: Stream.list(params), streamInstanceTotal: Stream.count()]
    }

    def create() {
        [streamInstance: new Stream(params)]
    }

    def save() {
        def streamInstance = new Stream(params)
        if (!streamInstance.save(flush: true)) {
            render(view: "create", model: [streamInstance: streamInstance])
            return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'stream.label', default: 'Stream'), streamInstance.id])
        redirect(action: "show", id: streamInstance.id)
    }

    def show(Long id) {
        def streamInstance = Stream.get(id)
        if (!streamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stream.label', default: 'Stream'), id])
            redirect(action: "list")
            return
        }
        [streamInstance: streamInstance]
    }

    def edit(Long id) {
        def streamInstance = Stream.get(id)
        if (!streamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stream.label', default: 'Stream'), id])
            redirect(action: "list")
            return
        }

        [streamInstance: streamInstance]
    }

    def update(Long id, Long version) {
        def streamInstance = Stream.get(id)
        if (!streamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stream.label', default: 'Stream'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (streamInstance.version > version) {
                streamInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'stream.label', default: 'Stream')] as Object[],
                          "Another user has updated this Stream while you were editing")
                render(view: "edit", model: [streamInstance: streamInstance])
                return
            }
        }

        streamInstance.properties = params

        if (!streamInstance.save(flush: true)) {
            render(view: "edit", model: [streamInstance: streamInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'stream.label', default: 'Stream'), streamInstance.id])
        redirect(action: "show", id: streamInstance.id)
    }

    def delete(Long id) {
        def streamInstance = Stream.get(id)
        if (!streamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stream.label', default: 'Stream'), id])
            redirect(action: "list")
            return
        }

        try {
			def lectureTimeTable=LectureTimeTable.findAllByStream(streamInstance)
			
				if(lectureTimeTable){
					lectureTimeTable.each{
						it.delete(flush: true)
						
						}
					
				def student=Student.findAllByStream(streamInstance)

//					def transpot=Transport.findAllByStudent(student)

					student.each{
						it.delete(flush: true)
						
						}
					
//					if(transpot){
//				transpot.each{
//					it.delete(flush: true)
//					
//				}	}
				
            streamInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'stream.label', default: 'Stream'), id])
            redirect(action: "list")
			}else{
			
			def student=Student.findAllByStream(streamInstance)
//			def transpot
//				transpot=Transport.findAllByStudent(student)

			
//			if(transpot){
//				transpot.each{
//					it.delete(flush: true)
//					
//				}	}
				student.each{
					it.delete(flush: true)
					
					}
				
				
			streamInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'stream.label', default: 'Stream'), id])
			redirect(action: "list")
			}
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'stream.label', default: 'Stream'), id])
            redirect(action: "show", id: id)
        }
    }
	def showsingle(Long id) {
		def streamInstance = Stream.get(id)
		if (!streamInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'stream.label', default: 'Stream'), id])
			redirect(action: "list")
			return
		}

		[streamInstance: streamInstance]
	}
//	def gettimetable(Long id){
//		def streamInstance = Stream.get(id)
//		println "st"+streamInstance.id
//		LectureTimeTable lect=LectureTimeTable.findAll{stream==streamInstance.id}
//		def results=lect.sort{it.peroid}
//		
//		
//		println "sdfasfdas==="+results.peroid
//		render view:"show",model:[streamInstance: results]
//	}
}
