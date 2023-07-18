class Upgrade < ApplicationRecord
  extend StaticAssociation::AssociationHelpers
  belongs_to :crew

  belongs_to_static :playbook, optional: true
end
