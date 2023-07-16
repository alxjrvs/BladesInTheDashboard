# frozen_string_literal: true

class Contact < ApplicationRecord
  extend StaticAssociation::AssociationHelpers
  include BroadcastUpdateable

  belongs_to :player_character
  belongs_to :crew
  belongs_to_static :playbook

  def source
    player_character || crew
  end

  default_scope { order(:order) }
end
