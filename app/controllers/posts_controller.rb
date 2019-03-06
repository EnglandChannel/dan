class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
    end

    def phone
        posts_for_branch(params[:action])
    end
    
    def laptop
        posts_for_branch(params[:action])
    end
    
    def headphone
        posts_for_branch(params[:action])
    end

    private

    def posts_for_branch(branch)
        @categories = Category.where(branch: branch)
        @posts = get_posts.paginate(page: params[:page])
    end

    def get_posts
        Post.limit(30)
    end
end
