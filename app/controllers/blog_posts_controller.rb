class BlogPostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

    def index
        @blog_posts = user_signed_in? ? BlogPost.sorted.all : BlogPost.sorted.published
    end

    def show
        rescue ActiveRecord::RecordNotFound
            redirect_to root_path
    end

    def new
        @blog_post = BlogPost.new
    end

    def create
        @blog_post = BlogPost.new(blog_post_params)

        if @blog_post.save
            redirect_to blog_post_path(@blog_post)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        rescue ActiveRecord::RecordNotFound
            redirect_to root_path
    end

    def update
        if @blog_post.update(blog_post_params)
            redirect_to blog_post_path(@blog_post)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @blog_post.destroy
        redirect_to root_path
        rescue ActiveRecord::RecordNotFound
            redirect_to root_path
    end


    private

    def blog_post_params
        params.require(:blog_post).permit(:title, :content, :published_at)
    end

    def set_blog_post
        @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
    end

    def authenticate_user!
        redirect_to new_user_session_path, alert: "You must sign in or sign up to continue." unless user_signed_in?
    end
end