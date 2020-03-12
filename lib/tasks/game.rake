# Run this using bundle exec rake game:like[55,127.0.0.1]
namespace :games do
  task :like, [:game_id, :ip] => :environment do |task,args|
    @game = Game.find(args.game_id)
    @prev_likes = @game.likes.count
    unless Like.recent.exists?(:user => args.ip, :game_id => args.game_id)
      @like = @game.likes.create(:user => args.ip)
      UserMailer.with(game: @game).like_email.deliver_now
    end
    @new_likes = @game.likes.count
    
    if @prev_likes == @new_likes
      puts 'Pleas wait to like the same game again!'
    else
      puts 'You just liked:'
      puts @game.name
      puts 'New likes count:'
      puts @game.likes.count
    end
  end
end
