package br.com.webbook
import org.ccil.cowan.tagsoup.*

class BookmarkService {

    def serviceMethod() {

    }
    
    def webScrap(String address){
       
        Bookmark b = new Bookmark()

        def url = new URL(address)

        @Grapes( @Grab("org.ccil.cowan.tagsoup:tagsoup:1.2.1") ) 
        def slurper = new XmlSlurper(new Parser())

        url.withReader { reader -> 
            
            def html = slurper.parse(reader) 
            html."**".findAll { it.name() == "title" }.each { 
                def title = it.text() 
                println title
         
                b.title = title      
        
            }
        }        
    }
}