class SetCrewDefaults < ActiveRecord::Migration[7.0]
  def change
    change_column_default :crews, :xp, from: nil, to: 0
    change_column_default :crews, :turf, from: nil, to: 0
    change_column_default :crews, :hold, from: nil, to: 0
    change_column_default :crews, :tier, from: nil, to: 0
    change_column_default :crews, :heat, from: nil, to: 0
    change_column_default :crews, :vaults, from: nil, to: 0
    change_column_default :crews, :coin, from: nil, to: 0
    change_column_default :crews, :wanted_level, from: nil, to: 0
  end
end
