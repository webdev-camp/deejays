require 'rails_helper'

RSpec.describe Genre, type: :model do

  it "has working factory" do
    genre = build :genre
    expect(genre.save).to be true
  end
end
