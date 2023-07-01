# frozen_string_literal: true

class SpecialAbility < ApplicationRecord
  extend StaticAssociation::AssociationHelpers

  belongs_to :player_character
  belongs_to_static :playbook
end
