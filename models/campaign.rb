class Campaign < ActiveRecord::Base
  # associations
  belongs_to :authorized_voice
  belongs_to :model_text

  # uploader
  mount_uploader :photo, CampaignImageUploader
end
