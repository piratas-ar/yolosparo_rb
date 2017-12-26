class Legi < ActiveRecord::Base
  def self.all_emails
    Legi.all.collect(&:email)
  end
end
