package br.com.webbook

class Filter {
    
    Date dateCreated
    Date lastUpdated
    
    String title
    Set<String> tags
    static belongsTo = [users : User]

    static constraints = {
    }
}
