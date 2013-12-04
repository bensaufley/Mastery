require 'spec_helper'

describe User do
  describe "#send_password_reset" do
    let(:user){ FactoryGirl.create(:user) }
    
    it "generates a unique password_reset_token each time" do
      user.send_reset_password_instructions
      last_token = user.reset_password_token
      user.send_reset_password_instructions
      user.reset_password_token.should_not eq(last_token)
    end
    
    it "saves the time the password reset was sent" do
      user.send_reset_password_instructions
      user.reload.reset_password_sent_at.should be_present
    end

    it "delivers email to user" do
      user.send_reset_password_instructions
      last_email.to.should include (user.email)
    end
  end

  describe "#create_user" do
    let(:user){ FactoryGirl.build(:user) }
    
    it "validates user" do
      user.should be_valid
    end

    [:first_name,:last_name,:username,:email].each do |a|
      it "does not validate with missing #{a.to_s.humanize}" do
        user[a]=nil
        user.should_not be_valid
      end
      # it "does not save invalid user" do
      #   user[a]=nil
      #   expect { user.save! }.to raise_error
      # end
    end

    it "does not validate with improper email" do
      user.email = "test"
      user.should_not be_valid
    end
    
    #i# t "saves valid user"
    # #  expect { user.save! }.to_not raise_exception
    #e# nd
  end
end