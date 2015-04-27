class Exercise < ActiveRecord::Base
  validates :name, :mets, presence: true, uniqueness: true

end
