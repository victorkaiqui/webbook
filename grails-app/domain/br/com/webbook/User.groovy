package br.com.webbook

class User {

    transient springSecurityService

    String name
    String lastName
    String email
    String username
    String password
    static hasMany = [bookmark : Bookmark]
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        name blank: false  
        lastName blank: false        
        username blank: false, unique: true
        email blank: false 
        password blank: false
 
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
