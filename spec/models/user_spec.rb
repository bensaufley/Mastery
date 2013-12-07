require 'spec_helper'

describe User do
  describe '#send_password_reset' do
    let(:user){ FactoryGirl.create(:user) }
    
    it 'generates a unique password_reset_token each time' do
      user.send_reset_password_instructions
      last_token = user.reset_password_token
      user.send_reset_password_instructions
      user.reset_password_token.should_not eq(last_token)
    end
    
    it 'saves the time the password reset was sent' do
      user.send_reset_password_instructions
      user.reload.reset_password_sent_at.should be_present
    end

    it 'delivers email to user' do
      user.send_reset_password_instructions
      last_email.to.should include (user.email)
    end
  end

  describe '#create' do
    let(:user){ FactoryGirl.build(:user) }
    
    it 'validates user' do
      user.should be_valid
    end
    
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email) }

    [:first_name,:last_name,:username,:email].each do |a|
      it { should validate_presence_of(a) }
    end

    it 'does not validate with improper email' do
      user.email = 'test'
      user.should_not be_valid
    end
    it 'does not save invalid user' do
      User.new.save.should be false
    end

    it 'saves valid user' do
      user.save!.should be true
    end
  end
end