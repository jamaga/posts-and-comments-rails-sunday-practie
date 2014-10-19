class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def destroy
		post = Post.find(params[:id]).destroy
		post.comments.each do |comment|
			comment.destroy
		end
		redirect_to root_path
	end
	
	def create
		@post = Post.create(post_params)
		redirect_to post_path(@post.id)
	end

	private
		def post_params
			post.require(:post).permit(:title, :content)
		end
end


