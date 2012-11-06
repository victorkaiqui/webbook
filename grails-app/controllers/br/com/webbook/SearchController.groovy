package br.com.webbook

class SearchController {

    def search() {
        
        def userResult =  User.search().list{
            
            keyword "username", params.query
            
            
        }
        
        def bookmarkResult =  Bookmark.search().list{
           
            keyword "pesquisa", params.query
            
            
        }
        
        [users : userResult , bookmarks : bookmarkResult]
    }
}
