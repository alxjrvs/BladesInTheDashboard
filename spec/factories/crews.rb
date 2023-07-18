FactoryBot.define do
  factory :crew do
    name { 'The Baddest Boys' }
    playbook { Playbook.crews.sample }
    reputation { 1 }
    reputation_description { 'MyText' }
    lair { 1 }
    lair_description { 'MyText' }
    hunting_ground { 1 }
    hunting_ground_description { 'MyText' }
    turf { 1 }
    hold { 1 }
    tier { 1 }
    heat { 1 }
    vaults { 1 }
    coin { 1 }
    wanted_level { 1 }
    xp { 1 }
  end
end
