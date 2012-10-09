class UrlMappings {

    static mappings = {
         "/$username"(controller: "user" , action: "profile")
        
	 "/$controller/$action?/$id?"{
            constraints {
                // apply constraints here
            }
        }
	
        "/"{
            controller = "Index"
        }
        
        
	"500"(view:'/error')
                
   
    }
}
