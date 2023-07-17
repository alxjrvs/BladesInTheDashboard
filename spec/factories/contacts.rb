# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    source { player_character }
    name { 'MyString' }
    job { 'MyString' }
    friend { false }
    rival { false }
  end
end
