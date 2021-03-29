class AddUserIdToClothing < ActiveRecord::Migration[6.1]
  def change
    add_column :clothings, :user_id, :integer
  end
end
