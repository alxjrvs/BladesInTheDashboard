# frozen_string_literal: true

FactoryBot.define do
  factory :player_character do
    user
    game
    crew

    playbook { Playbook.characters.sample }
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
    armor { Faker::Coin.flip }
    heavy { Faker::Coin.flip }
    special { Faker::Coin.flip }
    xp { Faker::Number.within(range: 0..9) }
    insight_xp { Faker::Number.within(range: 0..9) }
    prowess_xp { Faker::Number.within(range: 0..9) }
    resolve_xp { Faker::Number.within(range: 0..9) }
    hunt { Faker::Number.within(range: 0..4) }
    study { Faker::Number.within(range: 0..4) }
    survey { Faker::Number.within(range: 0..4) }
    tinker { Faker::Number.within(range: 0..4) }
    finesse { Faker::Number.within(range: 0..4) }
    prowl { Faker::Number.within(range: 0..4) }
    skirmish { Faker::Number.within(range: 0..4) }
    wreck { Faker::Number.within(range: 0..4) }
    attune { Faker::Number.within(range: 0..4) }
    command { Faker::Number.within(range: 0..4) }
    consort { Faker::Number.within(range: 0..4) }
    sway { Faker::Number.within(range: 0..4) }
    coin { Faker::Number.within(range: 0..3) }
    stash { Faker::Number.within(range: 0..9) }
    load { PlayerCharacter.loads.keys.sample }
  end
end
