class PagesController < ApplicationController
    def index
        @phone_posts = Post.by_branch('phone').limit(12)
        @laptop_posts = Post.by_branch('laptop').limit(6)
        @headphone_posts = Post.by_branch('headphone').limit(6)
    end
end
