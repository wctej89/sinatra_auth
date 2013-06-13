helpers do
	def authenticate(email, password)
		@user = User.find_by_email(email)

		if @user.password == password
			session[:user_id] = @user.id
			redirect '/'
		else
			redirect '/login'
		end
	end
	
end