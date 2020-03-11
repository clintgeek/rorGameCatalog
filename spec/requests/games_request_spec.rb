require 'rails_helper'

RSpec.describe GamesController do
  @game = Game.new(
    name: 'One',
    year: '1901',
    manufacturer: 'Pub1',
    description: 'Desc1',
  )
  @game.save

    it "should get index" do
      get '/games'
      expect(assigns(:games)).not_to be_nil
      assert_response :success
    end
    
    it "shoud get show for a single game" do
      get '/games/1'
      expect(assigns(:game).name).to eq('One')
      assert_response :success
    end
end

