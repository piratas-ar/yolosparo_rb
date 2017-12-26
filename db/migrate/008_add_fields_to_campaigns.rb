class AddFieldsToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.string :hashtag
    t.string :twitter_id
    end
  end

  def self.down
    change_table :campaigns do |t|
      t.remove :hashtag
    t.remove :twitter_id
    end
  end
end
