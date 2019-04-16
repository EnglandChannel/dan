class Order < ApplicationRecord
    belongs_to :user
    has_many :revenues
    has_many :line_items, :dependent => :destroy
    PAYMENT_TYPES = [ "Thanh toán khi nhận hàng", "Thẻ ngân hàng" ]
    validates :name, :address, :email, :pay_type, :presence => true
    validates :pay_type, :inclusion => PAYMENT_TYPES

    def add_line_items_from_cart(cart, order) 
        cart.line_items.each do |item|
            revenues.build(:order_id => order.id, :price => item.post.price)
            line_items << item
        end
    end
end
