require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "associations" do
    it "should be one of many for a game" do
      t = Game.reflect_on_association(:likes)
      expect(t.macro).to eq(:has_many)
    end

    it "belongs_to a game" do
      expect(described_class.reflect_on_association(:game).macro).to eq(:belongs_to)
    end
  end

  it "is valid with valid attributes" do 
    expect(Like.new).to be_valid
  end
end
