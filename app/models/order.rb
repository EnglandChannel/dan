class Order < ApplicationRecord
    has_many :line_items, :dependent => :destroy
    belongs_to :user
    has_many :revenues
    PAYMENT_TYPES = [ "Thanh toán khi nhận hàng", "Thẻ ngân hàng" ]
    validates :name, :address, :email, :pay_type, :presence => true
    validates :pay_type, :inclusion => PAYMENT_TYPES

    def add_line_items_from_cart(cart, order) 
        cart.line_items.each do |item|
            revenues.build(:order_id => order.id, :price => item.post.price)
            line_items << item
        end
    end

    def total_price 
        line_items.to_a.sum { |item| item.total_price }
    end
end
