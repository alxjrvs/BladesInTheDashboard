# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Creating Admin....'
admin = User.find_by(email: 'funnybunny@example.com') || (FactoryBot.create :user, admin: true,
                                                                                   email: 'funnybunny@example.com', password: 'password')
puts "Admin Created: #{admin.email}"

puts 'Creating Game...'
game = Game.find_by(name: 'scoundrels') || (FactoryBot.create :game, game_master: admin, name: 'scoundrels')
puts "Game created: #{game.name}"

puts 'Creating Players...'
unless game.players.any?
  FactoryBot.create_list :player_character, 3, { game: }
  game.player_characters.each do |character|
    puts "Player created: #{character.user.email} is #{character.name}"
  end
end
puts 'Done!'
