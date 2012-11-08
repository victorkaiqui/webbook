package br.com.webbook

import org.springframework.dao.DataIntegrityViolationException

class UserController {
    
    def springSecurityService
    def userService
    def mailService
    
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
   
      
    def password(){
        
        render view:"password"
        
    }
    
    def changePassword(){
        
        def user = User.findByEmail(params.email)
        
        user.password =  "123456"
        user.save()
        
        mailService.send("Nova senha Webbok", "Nova senha 123456" ,user.email )
        
        redirect uri:"/"
    }
    def profile(){
        
        def user = User.findByUsername(params.username)
        def userInstance = springSecurityService.currentUser
        
        
        if(user == null){
            render (view : "error404")
        }else{
            userInstance = User.get(userInstance.id)
            
            def timelineList = []
          
            timelineList.addAll(user.bookmarks)
            timelineList.sort{a , b -> b.dateCreated <=> a.dateCreated}        
             
            def listTags = []
            user.bookmarks.each{
                it.tags.each{ tag ->       
                    tag.split(",").each{ i ->        
                        listTags << i     
                    }              
                }
            }
           
            def tagsList = listTags.groupBy({it})

            def isFollowing = userInstance.isFollowing(user)
            render (view : "profile", model: [user : user , userInstance : userInstance, isFollowing: isFollowing , bookmarkInstanceList: Bookmark.findAllByUser(user),  tagsList: tagsList, timelineList : timelineList])
        }
    }    
    
    def followings(){ 
      
        def user = User.get(params.id)          
        def followings = user.followings 
        
        followings = followings.followed
        
        render(view: "followings", model: [user: user, followings : followings, bookmarkInstanceList: Bookmark.findAllByUser(user), bookmarkInstanceTotal: Bookmark.countByUser(user)])
    }

    def followers() {
        
        def user = User.get(params.id)          
        def followers = user.followers 
        
        followers = followers.follower
        
        render(view: "followers", model: [ user: user, followers : followers, bookmarkInstanceList: Bookmark.findAllByUser(user), bookmarkInstanceTotal: Bookmark.countByUser(user)])
    }
       
    def follow(){
              
        def userFollowed = User.findByUsername(params.username)
        def userFollower = springSecurityService.currentUser        
        def friendship = Friendship.findByFollowerAndFollowed(userFollower,userFollowed)
        
        if(!friendship){
            userService.follow(userFollower, userFollowed)
        }else{
            userService.unfollow(userFollower, userFollowed)
        }
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
