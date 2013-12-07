require 'spec_helper'

describe Activity do

  let(:user){ FactoryGirl.create(:user) }
  let(:activity){ FactoryGirl.create(:activity)}

  it 'belongs to a user' do
    pending
    activity.user = user
    activity.save
    activity.user.should be user
  end
end