class Timing < ApplicationRecord
  belongs_to :listing, optional: true
  def name
    self.day
  end

end
