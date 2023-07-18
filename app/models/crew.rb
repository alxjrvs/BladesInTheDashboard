class Crew < ApplicationRecord
  extend StaticAssociation::AssociationHelpers
  has_many :player_characters, dependent: :nullify
  belongs_to :game, optional: true
  belongs_to_static :playbook

  has_many :contacts, as: :source, dependent: :destroy
  has_many :special_abilities, as: :source, dependent: :destroy
  has_many :upgrades, dependent: :destroy
  has_many :claims, as: :source, dependent: :destroy

  enum reputation: { ambitious: 0, brutal: 1, daring: 2, honorable: 3, professional: 4, savvy: 5, subtle: 6, strange: 7 }
  enum lair: {
    whitecrown: 0,
    brightstone: 1,
    charterhall: 2,
    six_towers: 3,
    silkshore: 4,
    nightmarket: 5,
    crows_foot: 6,
    the_docks: 7,
    barrowcleft: 8,
    coalridge: 9,
    charhollow: 10,
    dunslough: 11
  }

  enum hunting_ground: { burglary: 0, espionage: 1, robbery: 2, sabotage: 3 }

  after_create :set_playbook_defaults

  def max_heat
    9
  end

  def max_rep
    12
  end

  private

  def set_playbook_defaults
    playbook.create_crew_assets(self)
  end
end
