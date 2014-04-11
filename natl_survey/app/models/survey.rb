class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :users_surveys
  validates :title, presence: true
end
