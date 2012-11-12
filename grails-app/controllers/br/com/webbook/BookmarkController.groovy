package br.com.webbook

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*

class BookmarkController {
    def springSecurityService
    def bookmarkService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    
    def list(){
              
        def user = springSecurityService.currentUser
        user = User.get(user.id)
        
        [bookmarkInstanceList: Bookmark.findAllByUser(user), bookmarkInstanceTotal: Bookmark.countByUser(user)]
    }
   

    def create() {
        [bookmarkInstance: new Bookmark(params)]
    }

    def save() {
        
        def bookmarkInstance = new Bookmark()  
        
        def user = springSecurityService.currentUser      
     
        bookmarkInstance.user = user
        bookmarkInstance.url = params.url
        bookmarkInstance.description = params.description                  
        //        bookmarkInstance.urlShorten = params.url.shorten()
     
        def tags = params.tags.split(",")            
        
        if (!bookmarkInstance.save(flush: true)) {
           
            render(view: "create", model: [bookmarkInstance: bookmarkInstance])
            return
        }        
            
        tags.each{
            def tag = new Tag()
            tag.text = it
            tag.setBookmark(bookmarkInstance)
            tag.save()
        }
        
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), bookmarkInstance.id])
        redirect(uri:"/", id: bookmarkInstance.id)
    }

    def favoritar(){
        
        def bookmark = new Bookmark() 
        def bookmarkOwner = Bookmark.get(params.id)
        def user = springSecurityService.currentUser       
   
        bookmark.title = bookmarkOwner.title
        bookmark.url =  bookmarkOwner.url
        bookmark.description =  bookmarkOwner.description    
        bookmark.idOwner = bookmarkOwner.id
        
        render bookmark as JSON
    }
    
    def preview(){
        render bookmarkService.webScrap(params.url) as JSON  
    }
    
    def show(Long id) {
        def bookmarkInstance = Bookmark.get(id)
        if (!bookmarkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), id])
            redirect(action: "list")
            return
        }

        [bookmarkInstance: bookmarkInstance]
    }

    def edit(Long id) {
        def bookmarkInstance = Bookmark.get(id)
        if (!bookmarkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), id])
            redirect(action: "list")
            return
        }

        [bookmarkInstance: bookmarkInstance]
    }

    def update(Long id, Long version) {
        def bookmarkInstance = Bookmark.get(id)
        if (!bookmarkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bookmarkInstance.version > version) {
                bookmarkInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'bookmark.label', default: 'Bookmark')] as Object[],
                          "Another user has updated this Bookmark while you were editing")
                render( uri: "/", model: [bookmarkInstance: bookmarkInstance])
                return
            }
        }

        bookmarkInstance.properties = params

        if (!bookmarkInstance.save(flush: true)) {
            render(uri: "/", model: [bookmarkInstance: bookmarkInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), bookmarkInstance.id])
        redirect(uri: "/", id: bookmarkInstance.id)
    }

    def delete(Long id) {
       
        def bookmarkInstance = Bookmark.get(id)
        if (!bookmarkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), id])
            redirect(uri: "/")
            return
        }

        try {
            bookmarkInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), id])
            redirect(uri: "/")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), id])
            redirect(action: "show", id: id)
        }
    }
}
