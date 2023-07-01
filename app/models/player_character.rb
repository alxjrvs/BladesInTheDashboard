# frozen_string_literal: true

class PlayerCharacter < ApplicationRecord
  extend StaticAssociation::AssociationHelpers

  EMPTY_HARM = { '1' => [], '2' => [], '3' => [] }.freeze
  EMPTY_ITEMS = {
    a_blade_or_two: {
      name: 'A Blade or Two',
      cost: 1,
      points: 0
    },
    a_large_weapon: {
      name: 'A Large Weapon',
      cost: 1,
      points: 0
    }
  }.freeze

  belongs_to :user
  belongs_to :game
  belongs_to_static :playbook

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

  EMPTY_TRAUMA = [].freeze
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

  private

  def set_playbook_defaults
    playbook = Playbook.first

    update(
      playbook:,
      playbook_items: playbook.items,
      contacts: playbook.contacts,
      special_abilities: playbook.special_abilities
    )
  end
end
