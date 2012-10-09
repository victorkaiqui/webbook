package br.com.webbook

class Bookmark {
    
    transient springSecurityService
    
    Date dateCreated
    Date lastUpdated
    
    String title
    String url
    String description
    Set<String> tags
    static belongsTo = [user : User]
    boolean visibility

    static constraints = {
    }
}
