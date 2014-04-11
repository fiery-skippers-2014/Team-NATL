require 'json'

get '/' do
  @user= current_user

  erb :index
end

get '/login' do

  erb :login
end

post '/login' do
  @user = User.authenticate(params)
  session[:user_id] = @user.id if @user

  redirect '/'
end

post '/register' do
  p params
  User.create(params)
  redirect '/'
end


get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
