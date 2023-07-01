# frozen_string_literal: true

class PlayerCharacter < ApplicationRecord
  extend StaticAssociation::AssociationHelpers

  belongs_to :user
  belongs_to :game
  belongs_to_static :playbook
  has_many :items, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :special_abilities, dependent: :destroy

  after_create :set_playbook_defaults

  enum heritage: %i[
    akoros
    dagger_isles
    iruvia
    severos
    skovlan
    tycheros
  ]
  enum background: %i[
    academic
    labor
    law
    trade
    military
    noble
    underworld
  ]
  enum vice: %i[
    faith
    gambling
    luxury
    obligation
    pleasure
    stupor
    weird
  ]

  enum trauma: %i[
    cold
    haunted
    obsessed
    paranoid
    reckless
    soft
    unstable
    vicious

  ]
  enum load: { light: 2, normal: 5, heavy: 6 }

  DEFAULT_ITEMS = {
    a_blade_or_two: {
      name: 'A Blade or Two'
    },
    a_pistol: {
      name: 'A Pistol'
    },
    a_large_weapon: {
      name: 'A Large Weapon',
      cost: 2
    },
    armor: {
      name: 'Armor',
      cost: 2
    },
    burglary_gear: {
      name: 'Burglary Gear'
    },
    arcane_implements: {
      name: 'Arcane Implements'
    },
    subterfuge_supplies: {
      name: 'Subterfuge Supplies'
    },
    tinkering_tools: {
      name: 'Tinkering Tools'
    },
    throwing_knife: {
      name: 'Throwing Knife'
    },
    a_2nd_pistol: {
      name: 'A 2nd Pistol'
    },
    an_unusual_weapon: {
      name: 'An Unusual Weapon'
    },
    heavy_armor: {
      name: 'Heavy Armor',
      cost: 3
    },
    climbing_gear: {
      name: 'Climbing Gear',
      cost: 2
    },
    documents: {
      name: 'Documents'
    },
    demolition_tools: {
      name: 'Demolition Tools',
      cost: 2
    },
    lantern: {
      name: 'Lantern'
    }
  }.freeze

  private

  def set_playbook_defaults
    playbook.create_assets(self)

    DEFAULT_ITEMS.each_key do |item_key|
      Item.create(DEFAULT_ITEMS[item_key].merge({ playbook_id: nil, player_character: self }))
    end
  end
end
