require 'rails_helper'

RSpec.describe "Likes", type: :request do
  @game = Game.new(
    name: 'One',
    year: '1901',
    manufacturer: 'Pub1',
    description: 'Desc1',
  )
  @game.save

  it "should find a game" do
    post('/games/1/likes/')
    @expected_game = '<Game id: 1, name: "One", description: "Desc1", year: 1901, manufacturer: "Pub1", active: nil, creat...:00:58", image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil>'
    expect(assigns(:game)[:name]).to eq("One")
  end

  it "should define a user" do
    post('/games/1/likes/')
    expect(assigns(:user)).to eq('127.0.0.1')
  end

  it "should define a like using same user" do
    post('/games/1/likes/')
    expect(assigns(:like)[:user]).to eq('127.0.0.1')
  end

  it "should send an email" do
    expect { post('/games/1/likes/') } .to change { ActionMailer::Base.deliveries.count }.by(1)
  end

end
