

# Run this using bundle exec rake game:like[55,127.0.0.1]
namespace :game do
  task :like, [:game_id, :ip] => :environment do |task,args|
    # you can remove the two "puts" if you want to, they just test that the args are working.
    puts args.game_id
    puts args.ip
  end
end
