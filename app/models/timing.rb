class Timing < ApplicationRecord
  belongs_to :listing, optional: true
  belongs_to :lessons, optional: true

  def name
    self.day
  end

end
