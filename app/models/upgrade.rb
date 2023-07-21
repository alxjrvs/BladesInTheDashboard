class Upgrade < ApplicationRecord
  extend StaticAssociation::AssociationHelpers
  belongs_to :crew

  belongs_to_static :playbook, optional: true

  scope :default, -> { where(playbook_id: nil) }
  scope :playbook, -> { where.not(playbook_id: nil) }
end
