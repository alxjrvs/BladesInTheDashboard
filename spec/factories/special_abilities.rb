# frozen_string_literal: true

FactoryBot.define do
  factory :special_ability do
    name { 'MyString' }
    description { 'MyText' }
    cost { 1 }
    points { 1 }
    detail { 'MyString' }
  end
end
