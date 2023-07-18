# frozen_string_literal: true

class PlayerCharacter < ApplicationRecord
  extend StaticAssociation::AssociationHelpers
  include BroadcastUpdateable

  belongs_to :user
  belongs_to :game
  belongs_to :crew
  belongs_to_static :playbook
  has_many :items, dependent: :destroy
  has_many :contacts, dependent: :destroy, as: :source
  has_many :special_abilities, dependent: :destroy, as: :source
  has_many :harms, dependent: :destroy
  has_many :trauma, dependent: :destroy

  after_create :set_playbook_defaults

  default_scope { includes(:contacts).includes(:items).includes(:special_abilities).includes(:harms).includes(:trauma) }

  STATS = {
    insight: %I[hunt study survey tinker],
    prowess: %I[finesse prowl skirmish wreck],
    resolve: %I[attune command consort sway]
  }.freeze

  enum heritage: { akoros: 0, dagger_isles: 1, iruvia: 2, severos: 3, skovlan: 4, tycheros: 5 }
  enum background: { academic: 0, labor: 1, law: 2, trade: 3, military: 4, noble: 5, underworld: 6 }
  enum vice: { faith: 0, gambling: 1, luxury: 2, obligation: 3, pleasure: 4, stupor: 5, weird: 6 }
  enum load: { light: 2, normal: 5, heavy: 6 }

  DEFAULT_ITEMS = JSON.parse(File.read('app/models/rules/default_items.json'))

  def current_load
    items.where(loaded: true, intrinsic: false).sum(:cost)
  end

  def load_capacity
    self.class.loads[load]
  end

  def load_remaining
    load_capacity - current_load
  end

  def friends
    contacts.where(friend: true)
  end

  def rivals
    contacts.where(rival: true)
  end

  def stress_boxes
    9
  end

  private

  def set_playbook_defaults
    playbook.create_character_assets(self)

    DEFAULT_ITEMS.each.with_index do |item, order|
      Item.create(item.merge({ order:, playbook_id: nil, player_character: self }))
    end
  end
end
