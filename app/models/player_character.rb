# frozen_string_literal: true

class PlayerCharacter < ApplicationRecord
  extend StaticAssociation::AssociationHelpers

  belongs_to :user
  belongs_to :game
  belongs_to_static :playbook
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items
  has_many :contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts
  has_many :special_abilities, dependent: :destroy
  accepts_nested_attributes_for :special_abilities

  after_create :set_playbook_defaults

  default_scope { includes(:contacts).includes(:items).includes(:special_abilities) }

  enum heritage: { akoros: 0, dagger_isles: 1, iruvia: 2, severos: 3, skovlan: 4, tycheros: 5 }
  enum background: { academic: 0, labor: 1, law: 2, trade: 3, military: 4, noble: 5, underworld: 6 }
  enum vice: { faith: 0, gambling: 1, luxury: 2, obligation: 3, pleasure: 4, stupor: 5, weird: 6 }
  enum trauma: { cold: 0, haunted: 1, obsessed: 2, paranoid: 3, reckless: 4, soft: 5, unstable: 6, vicious: 7 }
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
