class PostCommentsController < ApplicationController
	def create
		@book=Book.find(params[:book_id])
		comment=current_user.post_comments.new(post_comment_params)
		comment.book_id=@book.id
		if comment.save
		respond_to :js
		else
			@book=Book.new
			@books=Book.all
			@user=current_user
			@post_comment = PostComment.new
			render 'books/index'
		end
	end

	def destroy
		@book=Book.find(params[:book_id])
		post_comment=PostComment.find(params[:id])
		if post_comment.destroy
			respond_to :js
		else
		redirect_to book_path(book)
	end
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
