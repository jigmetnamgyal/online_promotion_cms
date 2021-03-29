class CreateListItems < ActiveRecord::Migration[6.1]
  def change
    create_table :list_items do |t|
      t.referances :clothing
      t.belongs_to :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
