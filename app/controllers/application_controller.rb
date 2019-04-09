class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    private
     
    def current_cart
        Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end

    helper_method :current_cart
    
    def redirect_if_not_signed_in
        redirect_to root_path if !user_signed_in?
    end
      
    def redirect_if_signed_in
        redirect_to root_path if user_signed_in?
    end
end
