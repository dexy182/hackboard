class PostsController < ApplicationController

	before_filter :authenticate_user!

	def index

		if params[:user_id].present?
			@posts = Post.where(user_id: params[:user_id])
		else
			@posts = Post.all
		end
		@posts = Post.includes(:comments).all
		
	end

	def mine
		@posts = current_user.posts
		render :index
	end

	def user_session
		session[:user_id] = User.find(params[:user_id])
		User.find(session[:user_id])
	end

	def new
		@posts = Post.new
	end

	def create
		@posts = current_user.posts.build(params[:post])
		#@posts = Post.new(params[:post])
		if @posts.valid?
			@posts.save
			redirect_to posts_path
		else
			render :new
		end
	end
end
