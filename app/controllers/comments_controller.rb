class CommentsController < ApplicationController

	skip_before_filter :authenticate_user!

	def create
		post = Post.find(params[:post_id])
		@comment = post.comments.build(params[:comment])

		@comment.user = current_user

		if @comment.save
			redirect_to posts_path
		else
			render 'new'
		end

	end
end
