require 'rails_helper'

RSpec.describe Game, type: :model do
  it "has many likes" do
    expect(described_class.reflect_on_association(:likes).macro).to eq(:has_many)
  end
  it "is valid with valid attributes" do 
    expect(Game.new).to be_valid
  end
end