class CreateAuthorizedVoices < ActiveRecord::Migration
  def self.up
    create_table :authorized_voices do |t|
      t.string :name
      t.text :quote
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :authorized_voices
  end
end
