class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :users_answers
end
