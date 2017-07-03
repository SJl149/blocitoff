class Task < ActiveRecord::Base
  belongs_to :user

  def self.expiring
    limit = Date.today - 7.days
    where(created_at: limit.midnight..limit.end_of_day)
  end
end
