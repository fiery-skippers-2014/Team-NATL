helpers do
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_completed_survey?(user, survey_1)
    surveys_completed = []
    user.users_surveys.each do |completed_survey|
      surveys_completed << completed_survey.id
    end
    p surveys_completed
    p survey_1.id
    if surveys_completed.include?(survey_1.id)
      return true
    else
      return false
    end
  end

end