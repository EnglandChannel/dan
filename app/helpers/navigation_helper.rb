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

    def create_cart
        Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
end