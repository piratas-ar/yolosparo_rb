class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :title
      t.string :slogan
      t.text :description
      t.string :photo
      t.text :objective
      t.integer :model_text_id
      t.integer :authorized_voice_id
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :campaigns
  end
end
