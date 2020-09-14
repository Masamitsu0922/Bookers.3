class RelationshipsController < ApplicationController

	def followerindex
		user=User.find(params[:id])
		@followers=user.following_user.where.not(id: current_user.id)
	end

	def followedindex
		user=User.find(params[:id])
		@followeds=user.follower_user.where.not(id: current_user.id)
	end

	def follow
		user=User.find(params[:id])
		current_user.follow(params[:id])
		redirect_to user_path(user)
	end

	def unfollow
		user=User.find(params[:id])
		current_user.unfollow(params[:id])
		redirect_to user_path(user)
	end
end
