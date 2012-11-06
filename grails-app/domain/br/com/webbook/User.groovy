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
    boolean accountExpired = false
    boolean accountLocked = false
    boolean passwordExpired = false   

    static search = {
        name index: 'tokenized'
        lastname index: 'tokenized'
        username index: 'tokenized'
    }
    
    static constraints = {
        name blank: false , size: 3..15  , nullable : true
        lastName blank: false , size: 3..15 , nullable : true      
        username blank: false, unique: true , size: 5..15
        email blank: false ,email: true
        password blank: false , password : true      
        birthyday widget : 'datePicker' , nullable : true
    }

    static mapping = {
        table "account"
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
    
    public boolean isFollowing(User user){
       
        for(Friendship f: followings){
            if(f.followed == user){                
                return true                
            }            
        }
        
        return false
    }
}
