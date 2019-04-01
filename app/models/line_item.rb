class LineItem < ApplicationRecord
    belongs_to :post
    belongs_to :cart

    def total_price
        post.price * quantity
    end
end
