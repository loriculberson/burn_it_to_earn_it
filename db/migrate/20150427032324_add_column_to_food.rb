class AddColumnToFood < ActiveRecord::Migration
  def change
    add_column :foods, :serving, :string
  end
end
