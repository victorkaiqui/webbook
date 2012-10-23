package br.com.webbook

import org.springframework.dao.DataIntegrityViolationException

class UserController {
    
    def springSecurityService
    def userService
    
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
   
    def profile(){
        
        def user = User.findByUsername(params.username)
        def userInstance = springSecurityService.currentUser
        userInstance = User.get(userInstance.id)

        def isFollowing = userInstance.isFollowing(user)
        render (view : "profile", model: [user : user , userInstance : userInstance, isFollowing: isFollowing])
        
    }    
       
    def follow(){
              
        def userFollowed = User.findByUsername(params.username)
        def userFollower = springSecurityService.currentUser        
        
        userService.follow(userFollower, userFollowed)

        redirect(action:"profile", params: [username: userFollowed.username])
             
    }
  

    
    def create() {
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
      
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])

        redirect(uri:"/" , id: userInstance.id)
        
        springSecurityService.reauthenticate(userInstance.getUsername(),userInstance.getPassword())

    }
 
    def editProfile() {
        def userInstance = springSecurityService.currentUser
        
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "config")
            return
        }

        render(view: "config", model: [userInstance: userInstance])
    }

    def editPassword(String password , String newPassword, String confirmPassword){
        
        def userInstance = springSecurityService.currentUser
        userInstance = User.get(userInstance.id)
        
        password = springSecurityService.encodePassword(password)
        
        if(userInstance.password == password && newPassword == confirmPassword){
            
            newPassword = springSecurityService.encodePassword(newPassword)             
            userInstance.password = newPassword
           
            if (!userInstance.save(flush: true)) {
                render(view: "config", model: [userInstance: userInstance])
                return
            }
            
            redirect(action: "config")
            
        }
        
        render(view: "config", model: [userInstance: userInstance])
    }
    
    def config() {
        
        def user = springSecurityService.currentUser
        
        render(view: "config", model: [user: user])
        
    }
    
    def update(Long id, Long version) {
        
        def userInstance = springSecurityService.currentUser
         
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "config")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "config", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "config", id: userInstance.id)
    }

    def delete() {
       
        def userInstance = springSecurityService.currentUser
        userInstance = User.get(userInstance.id)
        
        if (!userInstance) {                          
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "config")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "config")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "config", id: id)
        }
    }
}
