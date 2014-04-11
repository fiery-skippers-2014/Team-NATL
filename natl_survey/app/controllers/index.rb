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
  @user = current_user
  params[:user_id] = @user.id
  @survey = Survey.create(params)
  redirect "/survey/#{@survey.id}/question/new"
end

get '/survey/:id/question/new' do
  @survey = Survey.find(params[:id])
  erb :question_new
end

post '/survey/:id/question' do
  @question = Question.new(text: params[:text])
  @question.survey_id = params[:id]
  @question.save
  redirect "/survey/#{params[:id]}/question/#{@question.id}/choice/new"
end

get '/survey/:id/question/:question_id/choice/new' do
  @survey = Survey.find(params[:id])
  @question = Question.find(params[:question_id])
  erb :choice_new
end

post '/survey/:id/question/:question_id/choice' do
  p params
  @survey = Survey.find(params[:id])
  @question = Question.find(params[:question_id])
  choice1 = Choice.create(text: params[:text1], question_id: params[:question_id])
  choice2 = Choice.create(text: params[:text2], question_id: params[:question_id])
  choice3 = Choice.create(text: params[:text3], question_id: params[:question_id]) unless params[:text3].empty?
  choice4 = Choice.create(text: params[:text4], question_id: params[:question_id]) unless params[:text4].empty?
  choice5 = Choice.create(text: params[:text5], question_id: params[:question_id]) unless params[:text5].empty?
  redirect "/survey/#{@survey.id}"
end

# Viewing/ taking survey routes

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :survey
end

post '/survey/:id/submit' do
  #creates a record in users_surveys
  UsersSurvey.create(user_id: session[:user_id], survey_id: params[:id])
  #creates multiple record in users_answers
  #UsersChoice.create(:user_id : session[:user_id], :choice_id : ????)
end

