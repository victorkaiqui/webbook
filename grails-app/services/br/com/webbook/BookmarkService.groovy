package br.com.webbook
import org.ccil.cowan.tagsoup.Parser

class BookmarkService {

    def serviceMethod() {

    }
    
    def webScrap(String address){
        
        Bookmark b = new Bookmark()
        
        def url = new URL(address)

        @Grab("org.ccil.cowan.tagsoup:tagsoup:1.2.1")       
        def slurper = new XmlSlurper(new Parser())
        
        url.withReader { reader -> 

            html = slurper.parse(reader)
            b.title = html.title().text()
        }
        
        return b
    }
}
