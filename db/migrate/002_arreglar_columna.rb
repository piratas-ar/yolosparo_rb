class ArreglarColumna < ActiveRecord::Migration
  def self.up
    rename_column :legis, :type, :legi_type
  end

  def self.down
  end
end
