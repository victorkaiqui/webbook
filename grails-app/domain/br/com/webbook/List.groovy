package br.com.webbook

class List {

    Date dateCreated
    Date lastUpdated
    
    String titulo 
    String description
    boolean visibility
    
    static belongsTo = [user : User]
    static hasMany = [bookmarks : Bookmark]
    
    static constraints = {        
          description nullable : false
         description blank: false , maxSize: 160  , nullable : true
    }
}
