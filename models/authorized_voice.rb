class AuthorizedVoice < ActiveRecord::Base
  # associations
  has_one :campaigns

  def to_s
    name
  end
end
