class GamesController < ApplicationController
  def index
    @games = Game.all
      .select{|game| game.active == true}
      .sort_by{|game| game.year}
      .map do |x| 
        { 
          id: x.id,
          name: x.name,
          year: x.year,
          publisher: x.manufacturer,
        }
    end

    render json: @games
  end

  def like
    @game = Game.find(params[:game_id])
    @game.likes.create()
  end

  def show
    @game = Game.find(params[:id])
      render json: {
        id: @game.id,
        name: @game.name,
        year: @game.year,
        publisher: @game.manufacturer,
        description: @game.description,
        image: request.protocol + request.host_with_port + @game.image.url,
        likes: @game.likes.count
      }
  end
end
