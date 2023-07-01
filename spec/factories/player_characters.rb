# frozen_string_literal: true

FactoryBot.define do
  factory :player_character do
    user
    game

    playbook { Playbook.first }
    retired { Faker::Coin.flip }
    name { Faker::Name.name }
    nickname { Faker::Name.initials }
    look { Faker::Lorem.sentence }
    heritage { PlayerCharacter.heritages.keys.sample }
    heritage_description { Faker::Lorem.sentence }
    background { PlayerCharacter.backgrounds.keys.sample }
    background_description { Faker::Lorem.sentence }
    vice { PlayerCharacter.vices.keys.sample }
    vice_description { Faker::Lorem.sentence }
    stress { Faker::Number.within(range: 0..9) }
    trauma { [] }
    harm { { '1' => [], '2' => [], '3' => [] } }
    armor { Faker::Coin.flip }
    heavy { Faker::Coin.flip }
    special { Faker::Coin.flip }
    playbook_xp { Faker::Number.within(range: 0..9) }
    insight_xp { Faker::Number.within(range: 0..9) }
    prowess_xp { Faker::Number.within(range: 0..9) }
    resolve_xp { Faker::Number.within(range: 0..9) }
    coin { Faker::Number.within(range: 0..3) }
    stash { Faker::Number.within(range: 0..9) }
    load { PlayerCharacter.loads.keys.sample }
  end
end
