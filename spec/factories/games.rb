# frozen_string_literal: true

FactoryBot.define do

  factory :game do
    game_master { create(:user) }
    name { "Ne'er-do-wells" }
  end
end
