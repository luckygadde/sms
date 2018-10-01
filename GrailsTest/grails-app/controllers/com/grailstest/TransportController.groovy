package com.grailstest



import static org.springframework.http.HttpStatus.*

import org.springframework.dao.DataIntegrityViolationException;

//import grails.transaction.Transactional

//@Transactional
class TransportController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

   
	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[transportInstanceList: Transport.list(params), transportInstanceCount: Transport.count()]
	}
	
	
    def show(Long id) {
		
		def transportInstance = Transport.get(id)
		if (!transportInstance) {
			
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'transport.label', default: 'Transport'), id])
			redirect(action: "list")
			return
		}
		
		[transportInstance: transportInstance]
		
    }

    def create() {
		[transportInstance: new Transport(params)]
    }

 
    def save() {
		
		Transport.withTransaction { status ->
		try {
			def transportInstance = new Transport(params)
			
			params.student.each{
				Student  student = Student.get(it)
						student.transportfacility="Yes"
						student.save(failOnError :true, flush:true)
			}
			
			if (!transportInstance.save(flush: true)) {
				render(view: "create", model: [transportInstance: transportInstance])
				return
			}
			flash.message = message(code: 'default.created.message', args: [message(code: 'transport.label', default: 'Transport'), transportInstance.id])
			redirect(action: "show", id: transportInstance.id)
		} catch (Exception e) {
			status.setRollbackOnly()
		}
		
		
		}
		
		
    }

    def edit(Long id) {
	
		def transportInstance = Transport.get(id)
		
		if (!transportInstance) {
			
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'transport.label', default: 'Transport'), id])
			redirect(action: "list")
			return
		}

		[transportInstance: transportInstance]
    }

    //@Transactional
	def update(Long id, Long version) {
	
		def transportInstance = Transport.get(id)
		
		if (!transportInstance) {
			
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'transport.label', default: 'Transport'), id])
			redirect(action: "list")
			return
		}

		if (version != null) {
			
			if (transportInstance.version > version) {
				
				transportInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						  [message(code: 'transport.label', default: 'Transport')] as Object[],
						  "Another user has updated this Stream while you were editing")
				render(view: "edit", model: [transportInstance: transportInstance])
				return
			}
		}

		transportInstance.properties = params

		if (!transportInstance.save(flush: true)) {
			
			render(view: "edit", model: [transportInstance: transportInstance])
			return
		}
		
		flash.message = message(code: 'default.updated.message', args: [message(code: 'transport.label', default: 'Transport'), transportInstance.id])
		redirect(action: "show", id: transportInstance.id)
	}

   // @Transactional

	def delete(Long id) {
		def transportInstance = Transport.get(id)
		if (!transportInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'transport.label', default: 'Transport'), id])
			redirect(action: "list")
			return
		}

		try {
			transportInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'transport.label', default: 'Transport'), id])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'transport.label', default: 'Transport'), id])
			redirect(action: "show", id: id)
		}
	}
//    protected void notFound() {
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.not.found.message', args: [message(code: 'transport.label', default: 'Transport'), params.id])
//                redirect action: "index", method: "GET"
//            }
//            '*'{ render status: NOT_FOUND }
//        }
//    }
}
