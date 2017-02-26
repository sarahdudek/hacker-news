enable :sessions

get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:user][:username], params[:user][:password])
  if @user
    set_user(@user)
    redirect "/users/#{@user.id}"
  else
    status 422
    @errors = ["Login failed"]
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end
