FactoryGirl.define do
  factory :invalid_song , class: Song do
    sequence(:title) { |n| "Sunshine #{n}" }
    artist "Mc Yogi"
    album "Meditation"
    tempo "medium"
    factory :song do
      main_genre "world"
      link "http://mcyogi.com"
      info "Mc is a yogi"
      user { create :user }
    end
  end

end
