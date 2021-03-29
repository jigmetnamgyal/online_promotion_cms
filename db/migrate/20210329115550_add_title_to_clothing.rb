class AddTitleToClothing < ActiveRecord::Migration[6.1]
  def change
    add_column :clothings, :title, :string
  end
end
