# frozen_string_literal: true

class Contact < ApplicationRecord
  extend StaticAssociation::AssociationHelpers
  include BroadcastUpdateable

  belongs_to :source, polymorphic: true
  belongs_to_static :playbook

  default_scope { order(:order) }
end
