require 'rails_helper'

RSpec.describe Genre, type: :model do

  it "has working factory" do
    genre = build :genre
    expect(genre.save).to be true
  end

  it "validates low values of tempo" do
    genre = build :genre , :tempo => 5
    expect(genre.save).to be false
  end
end
