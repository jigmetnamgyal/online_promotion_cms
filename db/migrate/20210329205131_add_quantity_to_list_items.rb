class AddQuantityToListItems < ActiveRecord::Migration[6.1]
  def change
    add_column :list_items, :quantity, :integer, default: 1
  end
end
