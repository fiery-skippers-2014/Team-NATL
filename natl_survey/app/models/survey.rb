class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :users_surveys, dependent: :destroy
  validates :title, presence: true, uniqueness: true
end

