FactoryGirl.define do
  factory :genre do
    sequence :name do |n|
       "#{n}Rock"
     end
     tempo 11
  end

end
