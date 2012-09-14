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
    
    static mappedBy = [followers : 'followed' , followings : 'follower']
    static hasMany = [bookmarks : Bookmark , comments : Comment , filters : Filter, followers : Friendship , followings : Friendship ]    
    
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    
    

    static constraints = {
        name blank: false , nullable : true , size: 3..15  
        lastName blank: false , nullable : true , size: 3..15        
        username blank: false, unique: true , size: 5..15
        email blank: false ,email: true
        password blank: false , password : true      
        birthyday widget : 'datePicker' , nullable : true , blank:true
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
