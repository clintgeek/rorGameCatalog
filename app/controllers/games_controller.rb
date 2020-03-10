class GamesController < ApplicationController

  # returns json for the index page at /games
  def index
    games = Game.all.map do |x| 
      { 
        id: x.id,
        name: x.name,
        url: "http://localhost:3000" + x.image.url
      }
    end
    
    render json: games
  end

  # return json for the details of the game at /games/:id
  def show
    render json: "test"
  end


end
