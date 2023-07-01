# frozen_string_literal: true

FactoryBot.define do
  factory :player_character do
    user
    game

    retired { false }
    name { 'Rodger Rabbit' }
    nickname { 'Funny Bunny' }
    look { 'A rabbit with a carrot' }
    heritage { PlayerCharacter.heritages[:akoros] }
    heritage_description { 'Akorosian' }
    background { PlayerCharacter.backgrounds[:academic] }
    background_description { 'Academic' }
    vice { PlayerCharacter.vices[:faith] }
    vice_description { 'Faith' }
    stress { 0 }
    trauma { [] }
    harm { { '1' => [], '2' => [], '3' => [] } }
    armor { false }
    heavy { false }
    special { false }
    playbook_xp { 0 }
    insight_xp { 0 }
    prowess_xp { 0 }
    resolve_xp { 0 }
    coin { 0 }
    stash { 0 }
    load { PlayerCharacter.loads[:normal] }
  end
end
