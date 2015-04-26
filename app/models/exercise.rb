class Exercise < ActiveRecord::Base
  validates :name, :pace, presence: true, uniqueness: true

end
