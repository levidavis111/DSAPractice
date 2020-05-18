/*
*VERY SLOW; NEEDS REFINEMENT*

355. Design Twitter

Design a simplified version of Twitter where users can post tweets, follow/unfollow another user and is able to see the 10 most recent tweets in the user's news feed. Your design should support the following methods:

postTweet(userId, tweetId): Compose a new tweet.
getNewsFeed(userId): Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent.
follow(followerId, followeeId): Follower follows a followee.
unfollow(followerId, followeeId): Follower unfollows a followee.
Example:

Twitter twitter = new Twitter();

// User 1 posts a new tweet (id = 5).
twitter.postTweet(1, 5);

// User 1's news feed should return a list with 1 tweet id -> [5].
twitter.getNewsFeed(1);

// User 1 follows user 2.
twitter.follow(1, 2);

// User 2 posts a new tweet (id = 6).
twitter.postTweet(2, 6);

// User 1's news feed should return a list with 2 tweet ids -> [6, 5].
// Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
twitter.getNewsFeed(1);

// User 1 unfollows user 2.
twitter.unfollow(1, 2);

// User 1's news feed should return a list with 1 tweet id -> [5],
// since user 1 is no longer following user 2.
twitter.getNewsFeed(1);

*/
class Twitter {
    
    var followers = [Int: Set<Int>]()
    var tweets = [(Int, Int)]()

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Compose a new tweet. */
    func postTweet(_ userId: Int, _ tweetId: Int) {
        tweets.append((userId, tweetId))
    }
    
    /** Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent. */
    func getNewsFeed(_ userId: Int) -> [Int] {
        let following = followers[userId] ?? []
        let feed = tweets.reversed().reduce([]) { holder, value -> [Int] in
            let (tweetUserId, tweetId) = value
                                                 
            if userId == tweetUserId || following.contains(tweetUserId) {
                return holder + [tweetId]
            }
                return holder
        }
        
        return Array(feed.prefix(10))
    }
    
    
    /** Follower follows a followee. If the operation is invalid, it should be a no-op. */
    func follow(_ followerId: Int, _ followeeId: Int) {
        guard followerId != followeeId else {return}
        var followSet: Set<Int> = followers[followerId] ?? Set<Int>()
        followSet.insert(followeeId)
        followers[followerId] = followSet
    }
    
    /** Follower unfollows a followee. If the operation is invalid, it should be a no-op. */
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        guard followerId != followeeId else {return}
        guard var followSet: Set<Int> = followers[followerId] else {return}
        followSet.remove(followeeId)
        followers[followerId] = followSet 
    }
}

/**
 * Your Twitter object will be instantiated and called as such:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let ret_2: [Int] = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */
