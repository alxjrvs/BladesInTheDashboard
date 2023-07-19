# frozen_string_literal: true

class Playbook
  include StaticAssociation
  attr_accessor :name,
                :description,
                :items,
                :special_abilities,
                :contacts,
                :stats,
                :type,
                :xp_triggers,
                :upgrades,
                :claims

  def self.characters
    Playbook.all.select { |p| p.type == 'Character' }
  end

  def self.crews
    Playbook.all.select { |p| p.type == 'Crew' }
  end

  def create_character_assets(player_character)
    return unless type == 'Character'

    player_character.update(stats)

    special_abilities.each.with_index do |ability, order|
      SpecialAbility.create(ability.merge({ order:, playbook_id: id, source: player_character }))
    end
    items.each.with_index do |item, order|
      Item.create(item.merge({ order:, playbook_id: id, player_character: }))
    end
    contacts.each.with_index do |contact, order|
      Contact.create(contact.merge({ order:, playbook_id: id, source: player_character }))
    end
  end

  CHARACTER_PLAYBOOKS = %i[
    hound
  ].freeze

  CHARACTER_PLAYBOOKS.each do |playbook_name|
    playbook_data = JSON.parse(File.read("app/models/rules/playbooks/characters/#{playbook_name}.json"))
    record id: PlaybookIdEncoder.encode(playbook_name).to_i do |p|
      p.name = playbook_data['name']
      p.description = playbook_data['description']
      p.type = playbook_data['type']
      p.items = playbook_data['items']
      p.special_abilities = playbook_data['special_abilities']
      p.contacts = playbook_data['contacts']
      p.stats = playbook_data['stats']
      p.xp_triggers = playbook_data['xp_triggers']
    end
  end

  def create_crew_assets(crew)
    return unless type == 'Crew'

    special_abilities.each.with_index do |ability, order|
      SpecialAbility.create(ability.merge({ order:, playbook_id: id, source: crew }))
    end
    contacts.each.with_index do |contact, order|
      Contact.create(contact.merge({ order:, playbook_id: id, source: crew }))
    end

    upgrades.each.with_index do |upgrade, order|
      Upgrade.create(upgrade.merge({ order:, playbook_id: id, crew: }))
    end

    claims.each.with_index do |claim_group, y_coord|
      claim_group.each.with_index do |claim, x_coord|
        Claim.create(claim.merge({ claimed: claim['name'] == 'Lair', source: crew, y_coord:, x_coord: }))
      end
    end
  end

  CREW_PLAYBOOKS = %i[
    shadows
  ].freeze

  CREW_PLAYBOOKS.each do |playbook_name|
    playbook_data = JSON.parse(File.read("app/models/rules/playbooks/crews/#{playbook_name}.json"))
    record id: PlaybookIdEncoder.encode(playbook_name).to_i do |p|
      p.name = playbook_data['name']
      p.description = playbook_data['description']
      p.claims = playbook_data['claims']
      p.upgrades = playbook_data['upgrades']
      p.special_abilities = playbook_data['special_abilities']
      p.contacts = playbook_data['contacts']
      p.xp_triggers = playbook_data['xp_triggers']
      p.type = playbook_data['type']
    end
  end
end
