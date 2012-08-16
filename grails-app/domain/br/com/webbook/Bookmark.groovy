package br.com.webbook

class Bookmark {
    
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
