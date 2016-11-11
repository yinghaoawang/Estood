module SessionsHelper
  #probably should go in User's model
  def authenticate
    session_email = params[:session][:email]
    session_pass = params[:session][:password]
    if session_email && session_pass
      user = User.find_by_email session_email
        if user && (BCrypt::Password.new(user.password_hash) == session_pass)
          return true
        end
    end
    return false
  end

  #checks if user exists and is autheticated then it sets the session for user_id
  def log_in(user)
    if user && authenticate
      session[:user_id] = user.id
    end
  end

  #sets current_user to session's user_id's user
  def current_user
    current_user ||= User.find session[:user_id]
  end

  #checks if current_user exists
  def logged_in?
    !current_user.nil?
  end

  #deletes session's user_id
  def log_out
    session.delete(:user_id)
  end
end
