package br.com.webbook

class Tag {
    
    Date dateCreated
    Date lastUpdated
    
    String text
    
    static belongsTo = [bookmark : Bookmark]
     
    static constraints = {
        text nullable: true
    }
}
