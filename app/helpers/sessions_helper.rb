module SessionsHelper
  def log_in(user)
    session[:user_id] = user.user_id
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    logged_in?
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    end
  end
end
