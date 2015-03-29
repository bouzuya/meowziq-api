namespace :player do
  task run: :environment do
    player = Player.new
    player.run
  end
end
