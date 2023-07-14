# frozen_string_literal: true

class SpecialAbility < ApplicationRecord
  extend StaticAssociation::AssociationHelpers
  include BroadcastUpdateable

  belongs_to :player_character
  belongs_to_static :playbook

  default_scope { order(:order) }
  scope :active, -> { where("points = cost") }
  scope :inactive, -> { where.not("points = cost") }
end
