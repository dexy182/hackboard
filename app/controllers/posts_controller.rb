class PostsController < ApplicationController

	before_filter :authenticate_user!, except: [:index]

	def index

		if params[:user_id]
			@posts = Post.where(user_id: params[:user_id])
		else
			@posts = Post.includes(:comments).all
		end
		
		
	end

	def mine
		@post = current_user.posts
		render :index
	end

	def user_session
		session[:user_id] = User.find(params[:user_id])
		User.find(session[:user_id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(params[:post])
		#@post = Post.new(params[:post])
		if @post.valid?
			@post.save
			redirect_to posts_path
		else
			render :new
		end
	end
end
