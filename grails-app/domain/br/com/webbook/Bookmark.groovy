package br.com.webbook

class Bookmark {
   
    transient springSecurityService
    
    Date dateCreated
    Date lastUpdated
    
    String title
    String url
    String encodeUrl
    String urlShorten
    String description    
    Long idOwner
    static belongsTo = [user : User]
    boolean visibility

    static search = {
        title index: 'tokenized'
        description  index: 'tokenized'
        pesquisa  tags: 'tokenized'        
    }
    
    static constraints = {
        url url: true 
        urlShorten nullable : true
        encodeUrl nullable : true
        title nullable : true        
        description nullable : true        
        visibility nullable : true
        idOwner nullable : true
    }
    
    static hasMany = [comments : Comment, tags : Tag]  
    
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
