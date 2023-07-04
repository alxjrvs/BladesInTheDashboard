# frozen_string_literal: true

class Contact < ApplicationRecord
  extend StaticAssociation::AssociationHelpers

  belongs_to :player_character
  belongs_to_static :playbook

  default_scope { order(:order) }
end
