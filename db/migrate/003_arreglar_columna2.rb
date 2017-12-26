class ArreglarColumna2 < ActiveRecord::Migration
  def self.up
    rename_column :legis, :presonal_phone, :personal_phone
  end

  def self.down
  end
end
