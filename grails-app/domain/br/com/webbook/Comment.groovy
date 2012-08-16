package br.com.webbook

class Comment {

    Date dateCreated
    Date lastUpdated
    
    String text
    static belongsTo = [bookmark : Bookmark , user : User]
        
    static constraints = {
        text maxSize : 140 , blank: false, nullable :  false , widget: 'textarea'
    }
}
