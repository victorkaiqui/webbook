package br.com.webbook

class UserService {

    def serviceMethod() {

    }
  
    
    def follow(User userFollower, User userFollowed){
        
        if(userFollower != userFollowed ){
            new Friendship(follower: userFollower, followed: userFollowed).save(flush: true)
        }
    }
}
