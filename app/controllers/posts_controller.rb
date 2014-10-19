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

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes post_params
			redirect_to post_path(@post)
		else
			@errors = "say hello"
			render 'edit'
		end
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
			params.require(:post).permit(:title, :content, :id)
		end
end


