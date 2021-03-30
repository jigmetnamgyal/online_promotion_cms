class Cart < ApplicationRecord
    has_many :list_items, dependent: :destroy

    def add_clothing(clothing)
        current_item = list_items.find_by(clothing_id: clothing.id)

        if current_item
            current_item.increment(:quantity)
        else
            current_item = list_items.build(clothing_id: clothing.id)
        end
        current_item
    end

    def total_price
        # list_items.to_a.sum { |item| item.total_price }

        list_items.to_a.sum do |item|
            if list_items.count >= 3 && list_items.count < 5
                item.total_price - 100
            elsif list_items.count >=5 && list_items.count <=6
                item.total_price - 300
            elsif list_items.count > 6
                item.total_price - 400
            else 
                item.total_price
            end
        end
    end
end
