class Food < ActiveRecord::Base
  validates :name, :calories, presence: true, uniqueness: true
end
