require 'json'

get '/' do
  @user= current_user
  @surveys = Survey.all

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
  erb :_question_new, :layout => false
end

# get '/survey/:id/question/new' do
#   @survey = Survey.find(params[:id])
#   erb :question_new
# end

post '/survey/question' do

  @user = User.find(session[:user_id])
  @survey_id = @user.surveys.last.id
  @question = Question.new(text: params[:text])
  @question.survey_id = @survey_id
  @question.save
  erb :_choice_new, :layout => false
end

# get '/survey/:id/question/:question_id/choice/new' do
#   @survey = Survey.find(params[:id])
#   @question = Question.find(params[:question_id])
#   erb :choice_new
# end

post '/survey/question/choice' do
  @survey = Survey.find(params[:id])
  @question = Question.find(params[:question_id])
  choice1 = Choice.create(text: params[:text1], question_id: params[:question_id])
  choice2 = Choice.create(text: params[:text2], question_id: params[:question_id])
  choice3 = Choice.create(text: params[:text3], question_id: params[:question_id]) unless params[:text3].empty?
  choice4 = Choice.create(text: params[:text4], question_id: params[:question_id]) unless params[:text4].empty?
  choice5 = Choice.create(text: params[:text5], question_id: params[:question_id]) unless params[:text5].empty?
  # redirect "/survey/#{@survey.id}"
  erb :_choice_new, :layout => false
end

# Viewing/ taking survey routes

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :survey
end

post '/survey/submit' do
  params.each do |question_id, choice_id|
     UsersChoice.create(user_id: session[:user_id], choice_id: choice_id)
      @question = question_id
  end
  @question = Question.find(@question)
  UsersSurvey.create(user_id: session[:user_id], survey_id: @question.survey.id)

  redirect '/'
end

