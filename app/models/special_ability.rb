# frozen_string_literal: true

class SpecialAbility < ApplicationRecord
  extend StaticAssociation::AssociationHelpers
  include BroadcastUpdateable

  belongs_to :player_character
  belongs_to_static :playbook

  default_scope { order(:order) }
  scope :active, -> { where('points = cost or multipart = true and points > 0') }
  scope :inactive, -> { where(points: 0) }
end
