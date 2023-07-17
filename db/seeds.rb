# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'factory_bot'
require 'faker'

Rails.logger.debug 'Creating Admin....'
admin = User.find_by(email: 'funnybunny@example.com') || (FactoryBot.create :user, admin: true,
                                                                                   email: 'funnybunny@example.com', password: 'password')
Rails.logger.debug "Admin Created: #{admin.email}"

Rails.logger.debug 'Creating Game...'
game = Game.find_by(name: 'scoundrels') || (FactoryBot.create :game, game_master: admin, name: 'scoundrels')
Rails.logger.debug "Game created: #{game.name}"

Rails.logger.debug 'Creating Players...'
unless game.players.any?
  crew = FactoryBot.create :crew
  FactoryBot.create :player_character, game:, crew:, nickname: 'Showtime', name: 'Allistair Smoshmouth'
  game.player_characters.each do |character|
    Rails.logger.debug "Player created: #{character.user.email} is #{character.name}"
  end
end
Rails.logger.debug 'Done!'
