class LineItem < ApplicationRecord
    belongs_to :order, optional: true
    belongs_to :post
    belongs_to :cart

    def total_price
        post.price * quantity
    end

    def total_quantity
        1 * quantity
    end
end
