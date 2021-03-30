module ApplicationHelper
    def cart_plusplus
        if @cart.list_items.count > 0
            return total_cart_items if total_cart_items > 0
        end
    end

    def total_cart_items
        total = @cart.list_items.map(&:quantity).sum
        return total if total > 0
    end 
end
