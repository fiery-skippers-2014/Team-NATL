class UsersSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  validates :user_id, presence: true
  validates :survey_id, presence: true
end
