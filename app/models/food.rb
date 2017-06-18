class Food < ActiveRecord::Base
  validates :name, :calories, presence: true

  def self.search_by_name(food)
    Food.where("name ilike ?", "%#{food}%")
  end
end

