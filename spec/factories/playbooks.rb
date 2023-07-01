# frozen_string_literal: true

FactoryBot.define do
  factory :playbook do
    name { 'MyString' }
    description { 'MyText' }
    items { '' }
    contacts { '' }
    special_abilities { '' }
  end
end
