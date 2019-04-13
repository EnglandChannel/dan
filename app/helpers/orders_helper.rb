module OrdersHelper
    def user_infomation
        if user_signed_in?
            'orders/user_info/signed'
        else
            'orders/user_info/non_signed'
        end
    end
end
