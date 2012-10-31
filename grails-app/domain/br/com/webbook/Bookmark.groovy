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
    Set<String> tags  = [] as Set
    static belongsTo = [user : User]
    boolean visibility

    static constraints = {
        url url: true 
        urlShorten nullable : true
        encodeUrl nullable : true
        title nullable : true        
        description nullable : true
        tags nullable : true
        visibility nullable : true
    }
    
    static hasMany = [tags:String, comments : Comment]  
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
