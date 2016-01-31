FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    name "Test User"
    sequence( :email) { |n| "test#{n}@test.com" }
    password "please123"
    city "City"
    country "Coutry"
    factory :admin do
      sequence( :email) { |n| "admin#{n}@test.com" }
      admin 1
    end
  end
end
