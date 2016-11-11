class UserController < ApplicationController
  layout 'application'
  def index
    if logged_in?
      @user = current_user
    else
      redirect_to login_path
    end
    @postables = Postable.by_created_at
  end

  def show
    @user = User.find params[:id]
    @postables = Post.by_created_at
  end

  #signup_path is here
  def new
    #TODO clean this up with usage of session data
    valid_fields = true

    #less clear but more efficient
    #if there is no user submitted data then the fields are not valid
    if !params[:user].nil?
      name = params[:user][:name]
      email = params[:user][:email]
      password = params[:user][:password]
      confirm_password = params[:user][:confirm_password]

      #empty fields?
      if name.nil? || email.nil? || password.nil? || confirm_password.nil?
        valid_fields = false
      end
      #password same?
      if password != confirm_password
        valid_fields = false
      end
      #email unique?
      if User.find_by_email(email)
        #not unique
        valid_fields = false
      end
    else
      valid_fields = false
    end

    #if not valid then refreshes page
    if !valid_fields
    else
      #if everything checks out then create the user
      user = User.create(name: name) do |doc|
        doc.email = email
        doc.password_hash = BCrypt::Password.create(password)
        redirect_to action: 'index'
      end
    end
  end

  #create repost on a post
  def new_repost
    user = current_user
    post = Post.find params[:post_id]
    repost = Repost.find get_user_post_repost_id(user, post)
    if repost
      if repost.deleted
        repost.deleted = false
        repost.save
      end
    else
      repost = Repost.new(message: params[:message]) do |doc|
        doc.user = user
        doc.post = post
      end
      repost.save
      post.reposts << repost
      user.reposts << repost
      user.save
      post.save
    end

    redirect_to :back
  end

  #create comment on a post
  def new_comment
    user = current_user
    post = Post.find params[:post_id]
    comment = Comment.new(message: params[:message]) do |doc|
      doc.user = user
      doc.post = post
    end
    comment.save
    post.comments << comment
    user.comments << comment
    user.save
    post.save
    
    redirect_to :back
  end

  #changes to comment removed
  def delete_comment
    comment = Comment.find params[:comment_id]
    comment.deleted = true
    comment.save
    redirect_to :back
  end

  #like something that was posted
  def new_like
    user = current_user
    postable = Postable.find params[:postable_id]
    like = Like.find get_user_postable_like_id(user, postable)
    if like
      if like.deleted
        like.deleted = false
        like.save
      end
    else
      like = Like.new(user: user) do |doc|
        doc.postable = postable
      end
      like.save
      user.likes << like
      postable.likes << like
      user.save
      postable.save
    end

    redirect_to :back
  end

  #create post
  def new_post
    user = current_user
    message = params[:message]
    post = Post.new(message: message) do |doc|
      doc.user = user
    end
    post.save
    user.posts << post
    user.save

    redirect_to :back
  end

  #deletes post's id from user's post_ids property, however the post will still exist
  def delete_repost
    repost = Repost.find params[:repost_id]
    repost.deleted = true
    repost.save

    redirect_to :back
  end

  def delete_like
    like = Like.find params[:like_id]
    like.deleted = true
    like.save

    redirect_to :back
  end

  #deletes post's id from user's post_ids property, however the post will still exist
  def delete_post
    post = Post.find params[:post_id]
    post.deleted = true
    post.save

    redirect_to :back
  end

  def follow
    user = current_user
    other_user = User.find params[:user_id]
    user.following << other_user.id
    user.save
    other_user.followers << user.id
    other_user.save
    redirect_to :back
  end

  def unfollow
    user = current_user
    other_user = User.find params[:user_id]
    user.following.delete other_user.id
    user.save
    other_user.followers.delete user.id
    other_user.save
    redirect_to :back
  end
end
