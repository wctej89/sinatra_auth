helpers do

  def current_user
  	if session[:user_id]
  		@current_user = User.find(session[:user_id])
  	end
  	@current_user
    # TODO: return the current user if there is a user signed in.
  end

end
