class PagesController < ApplicationController
    def index
        @phone_posts = Post.by_branch('phone').limit(12)
        @latest_posts = Post.limit(9)
        @laptop_posts = Post.by_branch('laptop').limit(6)
    end
end
