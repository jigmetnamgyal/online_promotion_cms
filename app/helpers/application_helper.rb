module ApplicationHelper
    def cart_plusplus
        if @cart.list_items.count > 0
            return "<span class='tag is-dark'>#{@cart.list_items.count}<span>".html_safe
        end
    end

    def cart_has_items
        return @cart.list_items.count > 0
    end
end
