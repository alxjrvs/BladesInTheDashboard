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
  has_many :harms, dependent: :destroy
  accepts_nested_attributes_for :harms
  has_many :trauma, dependent: :destroy
  accepts_nested_attributes_for :trauma

  after_create :set_playbook_defaults

  default_scope { includes(:contacts).includes(:items).includes(:special_abilities) }

  enum heritage: { akoros: 0, dagger_isles: 1, iruvia: 2, severos: 3, skovlan: 4, tycheros: 5 }
  enum background: { academic: 0, labor: 1, law: 2, trade: 3, military: 4, noble: 5, underworld: 6 }
  enum vice: { faith: 0, gambling: 1, luxury: 2, obligation: 3, pleasure: 4, stupor: 5, weird: 6 }
  enum load: { light: 2, normal: 5, heavy: 6 }

  DEFAULT_ITEMS = JSON.parse(File.read('app/models/playbooks/default_items.json'))

  private

  def set_playbook_defaults
    playbook.create_assets(self)

    harms.create(label: '', level: 1)
    harms.create(label: '', level: 1)
    harms.create(label: '', level: 2)
    harms.create(label: '', level: 2)
    harms.create(label: '', level: 3)

    4.times do
      trauma.create
    end

    DEFAULT_ITEMS.each.with_index do |item, order|
      Item.create(item.merge({ order:, playbook_id: nil, player_character: self }))
    end
  end
end
