class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :users_choices
  has_many :choices
  validates :text, presence: true
end
