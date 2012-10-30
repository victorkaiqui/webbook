package br.com.webbook

class UserService {

    def serviceMethod() {

    }
  
    
    def follow(User userFollower, User userFollowed){
        
        if(userFollower != userFollowed ){
            def friendship = new Friendship(follower: userFollower, followed: userFollowed).save(flush: true)
            userFollower.addToFollowings(friendship).save()
            userFollowed.addToFollowers(friendship).save()
        }
    }
    
    def unfollow(User userFollower, User userFollowed){
        if(userFollower != userFollowed ){
          
            def f = Friendship.findByFollowerAndFollowed(userFollower,userFollowed)
            f.delete()
            
        }        
    }
}
