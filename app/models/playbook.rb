# frozen_string_literal: true

class Playbook
  include StaticAssociation
  attr_accessor :name, :description, :items, :special_abilities, :contacts

  def create_assets(player_character)
    create_special_abilities(player_character)
    create_items(player_character)
    create_contacts(player_character)
  end

  PLAYBOOKS = %i[hound]

  PLAYBOOKS.each.with_index do |playbook_name, i|
    playbook_data = JSON.parse(File.read("app/models/playbooks/#{playbook_name}.json"))

    record id: i do |p|
      p.name = playbook_data['name']
      p.description = playbook_data['description']
      p.items = playbook_data['items']
      p.special_abilities = playbook_data['special_abilities']
      p.contacts = playbook_data['contacts']
    end
  end

  private

  def create_special_abilities(player_character)
    special_abilities.each.with_index do |ability, order|
      SpecialAbility.create(ability.merge({order:, playbook_id: id, player_character: }))
    end
  end

  def create_items(player_character)
    items.each.with_index do |item, order|
      Item.create(item.merge({order:, playbook_id: id, player_character: }))
    end
  end

  def create_contacts(player_character)
    contacts.each.with_index do |contact, order|
      Contact.create(contact.merge({order:, playbook_id: id, player_character: }))
    end
  end
end
