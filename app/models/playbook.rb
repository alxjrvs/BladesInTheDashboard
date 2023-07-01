# frozen_string_literal: true

class Playbook
  include StaticAssociation
  attr_accessor :name, :description, :items, :special_abilities, :contacts

  def create_assets(player_character)
    create_special_abilities(player_character)
    create_items(player_character)
    create_contacts(player_character)
  end

  record id: 0 do |p|
    p.name = 'Hound'
    p.description = 'A deadly sharpshooter and tracker'
    p.items = {
      fine_long_rifle: {
        name: 'Fine Long Rifle',
        cost: 2,
        points: 0
      },
      spyglass: {
        name: 'Spyglass',
        cost: 1,
        points: 0
      },
      a_trained_hunting_pet: {
        name: 'A Trained Hunting Pet',
        intrinsic: true,
        cost: 1,
        points: 0
      }
    }
    p.special_abilities = {
      sharpshooter: {
        name: 'Sharpshooter',
        description: 'You can push yourself to do one of the following: make a ranged attack at extreme distance beyond what’s normal for the weapon—unleash a barrage of rapid fire to suppress the enemy.',
        cost: 1,
        points: 0
      },
      ghost_hunter: {
        name: 'Ghost Hunter',
        description: 'Your hunting pet is imbued with spirit energy. It gains potency when tracking or fighting the supernatural, and gains an arcane ability: ghost-form, mind-link, or arrow-swift. Take this ability again to choose an additional arcane ability for your pet.',
        cost: 2,
        points: 0
      }
    }

    p.contacts = {
      steiner: {
        name: 'Steiner',
        job: 'assasin',
        friend: false,
        rival: false
      }
    }
  end

  private

  def create_special_abilities(player_character)
    special_abilities.each_key do |ability_key|
      SpecialAbility.create(special_abilities[ability_key].merge({ playbook_id: id, player_character: }))
    end
  end

  def create_items(player_character)
    items.each_key do |item_key|
      Item.create(items[item_key].merge({ playbook_id: id, player_character: }))
    end
  end

  def create_contacts(player_character)
    contacts.each_key do |contact_key|
      Contact.create(contacts[contact_key].merge({ playbook_id: id, player_character: }))
    end
  end
end
