# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { 'MyString' }
    job { 'MyString' }
    friend { false }
    rival { false }
  end
end
