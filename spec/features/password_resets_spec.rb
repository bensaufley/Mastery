require 'spec_helper'

describe "PasswordResets" do
  describe "GET /password_resets" do
    it "emails user when requesting password reset from homepage" do
      user = FactoryGirl.create(:user)
      visit "/"
      find('a',text: /.*forg[eo]t.*password.*/i).click
      fill_in "Email", with: user.email
      click_button "reset password"
      last_email.to.should include(user.email)
    end
    it "emails user when requesting password reset from sign in page" do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      find('main a',text: /.*forg[eo]t.*password.*/i).click
      fill_in "Email", with: user.email
      click_button "reset password"
      last_email.to.should include(user.email)
    end
  end
end
