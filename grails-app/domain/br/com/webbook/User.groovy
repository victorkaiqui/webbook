package br.com.webbook

class User {

    transient springSecurityService
    
    Date dateCreated
    Date lastUpdated
    
    String name
    String lastName
    String email
    String username
    String password
    Date birthyday
    static hasMany = [bookmarks : Bookmark , comments : Comment , filters : Filter]    
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        name blank: false , size: 5..15  
        lastName blank: false , size: 5..15        
        username blank: false, unique: true , size: 5..15
        email blank: false ,email: true
        password blank: false , password : true     
        birthyday widget : 'datePicker'
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Authority> getAuthorities() {
        UserAuthority.findAllByUser(this).collect { it.authority } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
}
