require 'spec_helper'

describe User do
  it {should validate_uniqueness_of(:username) }
  it {should have_many(:surveys)}
  it {should have_many(:users_surveys)}
  it {should have_many(:users_choices)}
  it { should have_readonly_attribute(:password) }
end

describe Survey do
  it {should have_many(:questions)}
  it {should have_many(:users_surveys)}
end

describe Question do
	it {should belong_to(:survey)}
	it {should have_many(:choices)}
	it {should have_many(:users_choices)}
end

describe UsersSurvey do
  it {should belong_to(:user)}
  it {should belong_to(:survey)}
end

describe UsersChoice do
  it {should belong_to(:user)}
  it {should belong_to(:question)}
  it {should belong_to(:choice)}
end

describe Choice do
	it {should belong_to(:question)}
end

