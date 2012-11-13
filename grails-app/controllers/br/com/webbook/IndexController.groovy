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
             
            def listTags = []
//            bookmarks.tags.each{
//               println it
//            }
           
            def tagsList = listTags
            
            render(view:"/index", model: [user : user , bookmarkTotal: Bookmark.countByUser(user), timelineList: timelineList, tags: tagsList])
        }
        else {
            render(view:"/index" )
        }
         
    }
}
