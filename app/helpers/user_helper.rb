module UserHelper
    def user_is_following(user, other_user)
        user.following.each do |f|
            if f == other_user.id
                return true
            end
        end
        return false
    end

    def get_user_post_repost_id(user, post)
        post = Post.find post.id
        post.reposts.each do |r|
            if r.user == user
                return r.id
            end
        end

        return nil
    end

    def get_user_postable_like_id(user, postable)
        postable = Postable.find postable.id
        postable.likes.each do |l|
            if l.user == user
                return l.id
            end
        end

        return nil
    end

    def get_postable_visible_likes_count(postable)
        count = 0
        likes = Like.by_postable_id.key(postable.id)
        likes.each do |l|
            if l.visible && !l.deleted
                count += 1
            end
        end
        return count
    end

    def get_post_visible_reposts_count(post)
        count = 0
        reposts = Repost.by_post_id.key(post.id)
        reposts.each do |r|
            if r.visible && !r.deleted
                count += 1
            end
        end
        return count
    end

    def get_user_visible_posts_count(user)
        count = 0
        posts = Post.by_user_id.key(user.id)
        posts.each do |p|
            if p.visible && !p.deleted
                count += 1
            end
        end
        return count
    end

    #checks if user has liked something that has been posted
    def user_has_liked?(user, postable)
        postable.likes.each do |l|
            if l.user == user
                if !l.deleted
                    return true
                end
            end
        end
        return false
    end

    #check to see if the user has reposted a post
    def user_has_reposted?(user, post)
        if (!post.instance_variable_defined?(:@reposts))
            return false;
        end
        post.reposts.each do |r|
            #if it was reposted by the user
            if r.user == user
                #deleted means it's archived but is seen as if he canceled
                if !r.deleted
                    #if the user has reposted it and he did not "delete" it, then user can repost
                    return true
                end
            end
        end
        return false
    end

    #check if user can repost
    def user_can_repost?(user, post)
        #if user author of post or has reposted it already
        if post.user_id == user.id || user_has_reposted?(user, post)
            return false
        end
        return true
    end

    #check if user can like
    def user_can_like?(user, postable)
        if postable.user_id == user.id || user_has_liked?(user, post)
            return false
        end
        return true
    end
end
