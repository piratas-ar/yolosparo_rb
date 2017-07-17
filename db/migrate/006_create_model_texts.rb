class CreateModelTexts < ActiveRecord::Migration
  def self.up
    create_table :model_texts do |t|
      t.string :title
      t.text :content
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :model_texts
  end
end
