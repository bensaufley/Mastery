FactoryGirl.define do
  factory :user do
    first_name 'Test'
    last_name 'User'
    sequence(:username){|n| "test_user#{n}" }
    sequence(:email){|n| "example#{n}@example.com" }
    password 'changeme'
    password_confirmation 'changeme'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end