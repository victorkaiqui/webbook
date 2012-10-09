package br.com.webboo

class IndexController {

    def springSecurityService
    
    def index() { 
    
        if (springSecurityService.isLoggedIn()) {
            def user = springSecurityService.currentUser
        
            render(view:"/index", model: [user : user] )
        }
        else {
           render(view:"/index" )
        }
         
    }
}
