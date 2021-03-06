package br.com.webbook

class SearchController {
    
 
    
    def search() {        
        
        def userResult =  User.search().list{            
           
            wildcard  "username", "*" +  params.query  + "*"
          
        }
        userResult = userResult +  User.search().list{
            wildcard  "name", "*" + params.query + "*"
            wildcard  "lastName", "*" + params.query  + "*"                   
            
        }
        def bookmarkResult =  Bookmark.search().list{
           
            keyword   "tag",  "*" +  params.query + "*"
         
        }
        
        bookmarkResult = bookmarkResult +  Bookmark.search().list{
            wildcard   "pesquisa",  "*" +  params.query + "*"
            wildcard  "title", "*" + params.query + "*"
            wildcard  "description", "*" + params.query   + "*"          
           
        }
        
        [users : userResult , bookmarks : bookmarkResult]
    }
}
