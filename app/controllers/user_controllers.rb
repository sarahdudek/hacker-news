enable :sessions

get '/users/new' do
 erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    set_user(@user)
    redirect "/users/#{@user.id}"
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  if @user == current_user
    erb :'/users/show'
  else
    redirect '/'
  end
end
