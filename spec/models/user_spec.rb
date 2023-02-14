require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {create :user}
  let(:user1) {create :user}

  describe "testing model functions" do
    it "age should be eligible" do 
        user.age = 21
        expect(user).to be_eligible
    end
    it "age should not be eligible" do 
      user = create(:user, age: 18)
      expect(user).not_to be_eligible
    end
    it "make the name to be capitalize" do
      user = create(:user, name: "test")
      expect(user.capitalize_name).to eq("Test")
    end
  end

  describe "validations on presence" do
    [:name,:phone_number,:age,:email].each do |i|
      it { is_expected.to validate_presence_of(i) }
    end
  end

  describe "phone field" do 
    it "should have minimum 10" do 
      user.phone_number = "123"
      expect(user).to be_invalid
    end
    it "should have only maximum 15" do 
      user.phone_number = "123456789045"
      expect(user).to be_valid
      user.phone_number = "99999999999999999999999"
      expect(user).to be_invalid
    end
    it "be number only" do 
      user.phone_number = "tes6243as"
      expect(user).to be_invalid
    end
  end

  describe "email" do 
    it "should be uniq" do 
      user1.email = user.email
      expect(user1).to be_invalid 
    end
  end

  describe "callbacks" do 
    it {is_expected.to callback(:capitalize_name).before(:create)}
  end
  
  describe "Associations" do 
    it {should have_many(:accounts)}
  end
  
 
end

