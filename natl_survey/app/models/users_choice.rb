class UsersChoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
  belongs_to :question
  validates :user_id, presence: true
  validates :choice_id, presence: true
end
