class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :users_choices, dependent: :destroy
  has_many :choices, dependent: :destroy
  validates :text, presence: true
end
