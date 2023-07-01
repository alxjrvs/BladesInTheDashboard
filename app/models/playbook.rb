class Playbook < ApplicationRecord
  enum playbook: {
    hound: {
      name: "Hound",
      description: "A deadly sharpshooter and tracker",
      items: {
        fine_long_rifle: {
          name: 'Fine Long Rifle',
          cost: 2,
          points: 0
        },
        spyglass: {
          name: 'Spyglass',
          cost: 1,
          points: 0,
        },
        a_trained_hunting_pet: {
          name: 'A Trained Hunting Pet',
          intrinsic: true,
          cost: 1,
          points: 0
        }
      },
      special_abilities: {
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
        },
      },
      contacts: {
        steiner: {
          name: 'Steiner',
          job: 'assasin',
          friend: false,
          rival: false,
        }
      }
    }
  }
end
