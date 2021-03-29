class Clothing < ApplicationRecord
    has_attached_file :image, styles: { medium: "300x300>", thumb: "200x200>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /image/
    belongs_to :user, optional: true
    has_many :list_items

    # validates :brand, :description, :type, :price, presence: true 
    # validates :price, numericality: {only_integer: true}, length: {maximum: 7}

    BRAND = %w{Nike Gucci Adidas H&M Lungten JigmeBrand}
    
end
