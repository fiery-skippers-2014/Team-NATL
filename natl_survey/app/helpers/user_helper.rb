helpers do
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_completed_survey?(user, survey)
    user.users_surveys.each do |completed_survey|
      if completed_survey.survey.id == survey.id
        return true
      else
        return sfalse
      end
    end
  end

end