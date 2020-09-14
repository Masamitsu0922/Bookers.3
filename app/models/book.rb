class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def Book.search(search,user_or_book)
    if user_or_book =='2'
      Book.where(['title LIKE ?',"%#{search}%"])
    else
      Book.all
    end
    end

	validates :title, presence: true
	validates :body, presence: true
	validates :body, length: {maximum: 200}
end