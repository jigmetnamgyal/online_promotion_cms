class AddAttachmentImageToClothings < ActiveRecord::Migration[6.1]
  def self.up
    change_table :clothings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :clothings, :image
  end
end
