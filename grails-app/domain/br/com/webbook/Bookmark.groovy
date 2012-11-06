package br.com.webbook
import org.grails.taggable.*

class Bookmark implements Taggable {
   
    transient springSecurityService
    
    Date dateCreated
    Date lastUpdated
    
    String title
    String url
    String encodeUrl
    String urlShorten
    String description
    String pesquisa
    static belongsTo = [user : User]
    boolean visibility

    static search = {
        title index: 'tokenized'
        description  index: 'tokenized'
        pesquisa  index: 'tokenized'
        
    }
    static constraints = {
        url url: true 
        urlShorten nullable : true
        encodeUrl nullable : true
        title nullable : true        
        description nullable : true        
        visibility nullable : true
    }
    
    static hasMany = [comments : Comment]  
    
    def beforeInsert() {
        
        encodeUrl()
    }

    def beforeUpdate() {
        if (isDirty('encodeUrl')) {
            encodeUrl()
        }
    }
    
    protected void encodeUrl() {
        encodeUrl = springSecurityService.encodePassword(url)
    }
}
