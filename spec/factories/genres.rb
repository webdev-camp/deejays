FactoryGirl.define do
  factory :genre do
    sequence :name do |n|
       "#{n}Rock"
     end
  end

end
