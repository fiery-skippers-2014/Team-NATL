require 'spec_helper'

describe "IndexController" do

  it 'should go to the root index page "/"' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'should login the user' do
  	get "/login"
  	expect(last_response.body).to  include('create account')
  end

  #Yet to test login
  it 'should go to route "/login"' do
    post "/login",{username: 'AB',
         password: '123' 
		}
    expect(last_response).should be_redirect
  end

 	it "should be able to create a new survey" do
    post "/login", {
          username: 'AB',
          password: '123' }
    expect(last_response).should be_redirect
  end

  it 'should redirect to "/" from "/logout"' do
    get "/logout"
    expect(last_response.location).to include "/"
  end

#Guys, everytime you run the below test,change the username
#otherwise you will get an error, saying username is taken
  it 'should add a new user' do
  	new_params={username:"NAMZI", password: "123"}
		expect{
		post('/register', new_params)
		}.to change(User, :count).by(1)
		last_response.should be_redirect
	end
end


