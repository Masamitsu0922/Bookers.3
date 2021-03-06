class FavoritesController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		favorite = current_user.favorites.new(book_id: @book.id)
		if favorite.save
		respond_to :js
	end
	end

	def destroy
		@book=Book.find(params[:book_id])
		favorite=current_user.favorites.find_by(book_id:@book.id)
		if favorite.destroy
		respond_to :js
	end
	end
end
