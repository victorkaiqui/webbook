class UrlMappings {

    static mappings = {
         "/$username"(controller: "user" , action: "profile")
        
	 "/$controller/$action?/$id?"{
            constraints {
                
            }
        }
	
        "/"{
            controller = "Index"
        }
        
        
	"500"(view:'/error')
                
   
    }
}
