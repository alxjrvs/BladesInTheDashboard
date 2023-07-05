# frozen_string_literal: true

class SpecialAbility < ApplicationRecord
  extend StaticAssociation::AssociationHelpers
  include BroadcastUpdateable

  belongs_to :player_character
  belongs_to_static :playbook

  after_update_commit -> { broadcast_update(player_character) }

  default_scope { order(:order) }
end
