require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) {create :user}
  let(:user1) {create :user}

  describe "GET /index" do
    it "get all users" do 
      get '/users'
      expect(response).to have_http_status(200)
    end
  end

  describe "create" do 
    it "create user" do
      post users_path, {user: {name: "example", email: "example@gmail.com", age: 23, phone_number: "23232323232"}}
      expect(user).to be_persisted
    end
  end

  describe "get show" do
    it "get the specific user" do
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end

  describe "do update" do
    it "user" do
      first_user = User.create(name:'firstuser', age: 21, email: "firstuser@gmail.com", phone_number: "111111111111")
      patch user_path(first_user.id), user: {name:'testname'}
      expect(first_user.name).not_to be('firstuser')
    end
  end

  describe "delete" do
    it "user" do
      delete user_url(user)
      expect(User.count).to eq(0)
    end
  end
end

