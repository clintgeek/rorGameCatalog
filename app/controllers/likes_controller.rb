class LikesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @user = request.remote_ip
    unless Like.recent.exists?(:user => @user, :game_id => @game.id)
      @like = @game.likes.create(:user => request.remote_ip)
      UserMailer.with(game: @game).like_email.deliver_now
    end
  end
end
