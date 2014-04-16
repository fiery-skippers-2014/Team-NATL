get '/' do
  client = Instagram::Client.new
  @results = client.get_posts




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
  User.create(params)
  @user = User.last
  session[:user_id] = @user.id
  redirect '/'
end


get '/logout' do
  session[:user_id] = nil
  redirect '/'
end


# Creating survey routes


# get '/' do
#   erb :index
# end

# post '/subreddits' do
#   p params
#   client = Reddit::Client.new
#   @username = params[:username]
#   @subreddit = params[:subreddit]
#   @results = client.get_posts(params[:username], params[:subreddit])
#   erb :_results, :layout => false
# end

# post '/images' do
#   p params
#   client = Reddit::Image.new
#   @pic_results = client.get_images(params[:subreddit])
#   erb :_pics
# end

# get '/images' do
# erb :images

# end
