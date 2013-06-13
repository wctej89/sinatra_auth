get '/' do
	@users = User.all
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
	authenticate(params[:email], params[:password])
	redirect '/'
  # sign-in
end

delete '/sessions/:id' do
	session.clear
	redirect '/'
  # sign-out -- invoked via AJAX
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
	@user = User.create(params[:user])
	session[:user_id] = @user.id
  redirect '/'
  # sign-up a new user
end
