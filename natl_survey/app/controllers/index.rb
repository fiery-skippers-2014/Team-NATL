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

get '/survey/new' do
  erb :survey_new
end

post '/survey' do

  @user = current_user
  params[:user_id] = @user.id
  new_params =  params.to_a
  title = new_params.shift
  user = new_params.pop
  pic =  new_params.shift
  Survey.create(title: title[1], user_id: params[:user_id], pic: pic[1])
  @survey = Survey.find_by_title(title[1])
  new_params.each_with_index do |value, index|
    if index % 6 == 0
      Question.create(survey_id: @survey.id, text: value[1])
    else
      question = Question.last
      Choice.create(question_id: question.id, text: value[1]) if value[1].length > 0
    end
  end




  # @survey = Survey.create(params)
  redirect "/survey/#{@survey.id }"
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

post '/survey/submit' do
  params.each do |question_id, choice_id|
     UsersChoice.create(user_id: session[:user_id], choice_id: choice_id, question_id: question_id)
      @question = question_id
  end
  @question = Question.find(@question)
  UsersSurvey.create(user_id: session[:user_id], survey_id: @question.survey.id)

  redirect '/'
end

get '/users/:id' do
  if session[:user_id].to_i == params[:id].to_i
    @user = User.find(session[:user_id])
    erb :profile
  else
    redirect '/'
  end
end

