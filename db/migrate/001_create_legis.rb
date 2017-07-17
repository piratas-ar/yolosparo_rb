class CreateLegis < ActiveRecord::Migration
  def self.up
    create_table :legis do |t|
      t.string :type
      t.string :full_name
      t.string :user_name
      t.string :email
      t.string :picture_url
      t.string :district
      t.date :start_date
      t.date :end_date
      t.string :party
      t.string :block
      t.string :phone
      t.string :address
      t.string :presonal_phone
      t.string :personal_address
      t.string :secretary_name
      t.string :secretary_phone
      t.string :site_url
      t.string :twitter_account
      t.string :facebook_account
      t.string :region
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :legis
  end
end
