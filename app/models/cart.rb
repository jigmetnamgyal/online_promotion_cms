class Cart < ApplicationRecord
    has_many :list_items, dependent: :destroy

    def add_clothing(clothing)
        current_item = list_item.find_by(clothing_id: clothing.id)

        if current_item
            current_item.increment(:quantity)
        else
            current_item = list_item.build(clothing_id: clothing.id)
        end
        current_item
    end
end
