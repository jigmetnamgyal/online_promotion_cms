class Clothing < ApplicationRecord
    has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    belongs_to :user, optional: true

    validate :brand, :description, :type, :price, presence: true 
    validate :price, numericality: {only_integer: true}, length: {maximum: 7}

    BRAND = %w {Nike Gucci Adidas H&M Lungten JigmeBrand}
    
end
