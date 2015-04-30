class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :brand
      t.integer :calories
      t.decimal :fat

      t.timestamps null: false
    end
  end
end
