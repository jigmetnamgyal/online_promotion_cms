class CreateClothings < ActiveRecord::Migration[6.1]
  def change
    create_table :clothings do |t|
      t.string :brand
      t.text :description
      t.string :type
      t.decimal :price

      t.timestamps
    end
  end
end
