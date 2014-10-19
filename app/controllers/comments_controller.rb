class CommentsController < ApplicationController
	
	def new
		@post_id = params[:post_id]
		@comment = Comment.new
	end

	def create
		@comment = Comment.create(comment_params)
		redirect_to post_comment_path(@comment.post.id, @comment.id)
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def destroy
		Comment.find(params[:id]).destroy
		redirect_to post_path(params[:post_id])
	end
	
	private
		def comment_params
			params.require(:comment).permit(:title, :content, :post_id)
		end
end
