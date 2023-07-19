module HasContacts
  extend ActiveSupport::Concern

  included do
    has_many :contacts, dependent: :destroy, as: :source
  end

  def friends
    contacts.where(friend: true)
  end

  def rivals
    contacts.where(rival: true)
  end

  def strangers
    contacts.where(rival: false, friend: false)
  end
end
