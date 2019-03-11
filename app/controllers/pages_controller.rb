class PagesController < ApplicationController
    def index
        @phone_posts = Post.by_branch('phone').limit(8)
        @laptop_posts = Post.by_branch('laptop').limit(8)
        @headphone_posts = Post.by_branch('headphone').limit(8)
    end
end
