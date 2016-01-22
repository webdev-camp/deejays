FactoryGirl.define do
  factory :invalid_song , class: Song do
    sequence(:title) { |n| "Sunshine #{n}" }
    artist "Mc Yogi"
    album "Meditation"
    speed "medium"
    factory :song do
      genre "world"
      link "http://mcyogi.com"
      info "Mc is a yogi"
    end
  end

end
