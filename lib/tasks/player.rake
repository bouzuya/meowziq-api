namespace :player do
  task play: :environment do
    player = Player.new
    player.run
  end
end
