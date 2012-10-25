package br.com.webbook

class IndexController {

    def springSecurityService
    
    def index() { 
    
        if (springSecurityService.isLoggedIn()) {
            def user = springSecurityService.currentUser
            user = User.get(user.id)
            
            def timelineList = []
            user.followings.each {
                timelineList.addAll(it.followed.bookmarks)  
            }
            timelineList.addAll(user.bookmarks)
            timelineList.sort{a , b -> b.dateCreated <=> a.dateCreated}
        
            
            
            render(view:"/index", model: [user : user , bookmarkInstanceTotal: Bookmark.countByUser(user), timelineList: timelineList] )
        }
        else {
            render(view:"/index" )
        }
         
    }
}
