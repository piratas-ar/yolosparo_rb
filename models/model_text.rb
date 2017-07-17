class ModelText < ActiveRecord::Base
  # associations
  has_one :campaigns

  def to_s
    title
  end
end
