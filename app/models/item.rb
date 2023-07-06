# frozen_string_literal: true

class Item < ApplicationRecord
  extend StaticAssociation::AssociationHelpers
  include BroadcastUpdateable

  belongs_to :player_character
  belongs_to_static :playbook

  default_scope { order(:order) }

  scope :default, -> { where(playbook_id: nil) }
  scope :playbook, -> { where.not(playbook_id: nil) }
end
