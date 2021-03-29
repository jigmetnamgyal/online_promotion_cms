class Cart < ApplicationRecord
    has_many :list_items, dependent: :destroy
end
