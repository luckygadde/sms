package com.grailstest



import static org.springframework.http.HttpStatus.*

import org.springframework.dao.DataIntegrityViolationException;


//@Transactional
class PaymentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def mailserviceService
   
	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[paymentInstanceList: Payment.list(params), paymentInstanceCount: Payment.count()]
	}
	
	
    
	def show(Long id) {

		def paymentInstance = Payment.get(id)
		if (!paymentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), id])
			redirect(action: "list")
			return
		}
		[paymentInstance: paymentInstance]
		
	}

    def create() {
       [paymentInstance: new Payment(params)]
    }

    def save() {
		Payment.withTransaction {stats ->
			try{
     	def paymentInstance = new Payment(params)

			
//			Student  student = Student.get(params.student.id as Long) //it is also correct
//			Student  student = Student.get(params.long('student.id'))
		paymentInstance.student = Student.get(params.studentid)
//			student.fee="Done"
			paymentInstance.student.fee="Done"
			
//			if(student.validate()){
			if(paymentInstance.student.validate()){
				
			
//        student.save(flush:true)
				paymentInstance.student.save(flush:true)
		}else{
		paymentInstance.student.errors.allErrors.each {
		println it
			}
		throw new Exception()
		}
		def paymentsave=paymentInstance.save(flush: true)
		
		if (!paymentsave) {
			render(view: "create", model: [paymentInstance: paymentInstance])
			return
		}
		flash.message = message(code: 'default.created.message', args: [message(code: 'payment.label', default: 'Payment'), paymentInstance.id])
		redirect(action: "show", id: paymentInstance.id)
		if(paymentsave!=null){
			String emaild=paymentInstance.student.email
			String name=paymentInstance.student.firstName
			Date  paydate=paymentInstance.paymentdate
			mailserviceService.sendPaymentSucessMail(emaild,name,paydate)
			}
		
		
		} catch (Exception e) {
		stats.setRollbackOnly()
//		flash.message ="student already payed some amount.you need to edit the payment."
//		redirect(action: "show")
	}
		}
		
		
		
    }

	def edit(Long id) {
		def paymentInstance = Payment.get(id)
		if (!paymentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), id])
			redirect(action: "list")
			return
		}
		[paymentInstance: paymentInstance]
	}

	def update(Long id, Long version) {
		def paymentInstance = Payment.get(id)
		if (!paymentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), id])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (paymentInstance.version > version) {
				paymentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						  [message(code: 'payment.label', default: 'Payment')] as Object[],
						  "Another user has updated this Stream while you were editing")
				render(view: "edit", model: [paymentInstance: paymentInstance])
				return
			}
		}

		paymentInstance.properties = params

		if (!paymentInstance.save(flush: true)) {
			render(view: "edit", model: [paymentInstance: paymentInstance])
			return
		}
		flash.message = message(code: 'default.updated.message', args: [message(code: 'payment.label', default: 'Payment'), paymentInstance.id])
		redirect(action: "show", id: paymentInstance.id)
	}
	
	def delete(Long id) {
		def paymentInstance = Payment.get(id)
		if (!paymentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), id])
			redirect(action: "list")
			return
		}

		try {
			paymentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'payment.label', default: 'Payment'), id])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'payment.label', default: 'Payment'), id])
			redirect(action: "show", id: id)
		}
	}
	
    

}
