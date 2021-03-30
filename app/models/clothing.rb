class Clothing < ApplicationRecord
    before_destroy :not_referenced_by_any_list_item
    belongs_to :user, optional: true
    has_many :list_items
    
    has_attached_file :image, styles: { medium: "300x300>", thumb: "200x200>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /image/
    

    # validates :brand, :description, :type, :price, presence: true 
    # validates :price, numericality: {only_integer: true}, length: {maximum: 7}

    BRAND = %w{Nike Gucci Adidas H&M Lungten JigmeBrand}

    private 
    
    def not_referenced_by_any_list_item
        unless list_items.empty?
            errors.add(:base, "List item is not present")
            throw :abort
        end
    end
    
end
