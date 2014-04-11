class User < ActiveRecord::Base
  has_many :surveys
  has_many :user_surveys
  has_many :user_answers

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.create(params)
    @user = User.new(params)
    @user.password = params[:password]
    @user.save!
  end

  def self.authenticate(params)
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      @user
    else
      nil
    end
  end

end
