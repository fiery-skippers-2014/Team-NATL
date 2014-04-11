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


# Creating survey routes

get '/survey/new' do
  erb :survey_new
end

post '/survey' do
  @survey = Survey.create(params)
  redirect "/survey/#{@survey.id}/question/new"
end

get '/survey/:id/question/new' do
  @survey = Survey.find(params[:id])
  erb :question_new
end

post '/survey/:id/question' do
  @question = Question.create(params)
  redirect "/survey/#{params[:id]}/question/#{@question.id}/choice/new"
end

get '/survey/:id/question/:question_id/choice/new' do
  erb :choice_new
end

post '/survey/:id/question/:question_id/choice' do
  #creates between 2 and 5 records in choices
end

# Viewing/ taking survey routes

get '/survey/:id' do
  @survey = Survey.find(params)
  erb :survey
end

post '/survey/:id/submit' do
  #creates a record in users_surveys
  UsersSurvey.create(user_id: session[:user_id], survey_id: params[:id])
  #creates multiple record in users_answers
  #UsersChoice.create(:user_id : session[:user_id], :choice_id : ????)
end

