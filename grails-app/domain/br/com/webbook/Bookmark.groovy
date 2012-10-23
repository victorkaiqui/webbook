package br.com.webbook

class Bookmark {
   
    transient springSecurityService
    
    Date dateCreated
    Date lastUpdated
    
    String title
    String url
    String encodeUrl
    String description
    Set<String> tags
    static belongsTo = [user : User]
    boolean visibility

    static constraints = {
        title nullable : true
        url url: true
        description nullable : true
        tags nullable : true
        visibility nullable : true
    }
    
    
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
