class PlayerCharacter < ApplicationRecord
  enum heritage: %i[
    akoros
    dagger_isles
    iruvia
    severos
    skovlan
    tycheros
  ]
  enum background: %i[
    academic
    labor
    law
    trade
    military
    noble
    underworld
  ]
  enum vice: %i[
    faith
    gambling
    luxury
    obligation
    pleasure
    stupor
    weird
  ]

  enum trauma: %i[
    cold
    haunted
    obsessed
    paranoid
    reckless
    soft
    unstable
    vicious

  ]
  enum load: { light: 2, normal: 5, heavy: 6 }
end
