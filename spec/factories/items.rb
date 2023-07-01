# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { 'MyString' }
    cost { 1 }
    points { 1 }
    intrinsic { false }
  end
end
