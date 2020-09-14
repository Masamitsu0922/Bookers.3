class SearchsController < ApplicationController
	def search
		@user_or_book =params[:option]
		@law=params[:law]
		if @user_or_book == '1'
			@users=User.search(params[:search],@user_or_book,@law)
		else
			@books=Book.search(params[:search],@user_or_book)
		end
	end
end