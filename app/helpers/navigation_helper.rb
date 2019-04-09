module NavigationHelper
    def collapsible_links_partial_path
        if user_signed_in?
            'layouts/navigation/collapsible_elements/signed_in_links'
        else
            'layouts/navigation/collapsible_elements/non_signed_in_links'
        end
    end

    def show_cart_icon
        if session[:cart_id]
            'layouts/navigation/collapsible_elements/cart_element/have_session'
        else
            'layouts/navigation/collapsible_elements/cart_element/none_session'
        end
    end

    def cart_count_over_one
        if current_cart
            if current_cart.line_items.length > 0
                return current_cart.line_items.length
            else
                return 0
            end
        end
    end

    def create_cart
        Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
end