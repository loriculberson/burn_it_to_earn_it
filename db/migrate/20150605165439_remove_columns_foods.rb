class RemoveColumnsFoods < ActiveRecord::Migration
  def change
    remove_column :foods, :serving, :string
    remove_column :foods, :fat, :decimal
  end
end
