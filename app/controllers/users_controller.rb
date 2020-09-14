class UsersController < ApplicationController

  def top
  end

  def index
  	@users=User.all
  	#全てのユーザー情報を所得
    @user=current_user
    @users=User.all
    @book=Book.new
  end
  def show
  	@user=User.find(params[:id])
  	# 指定ユーザーのパラメーターを所得
  	@books= @user.books
  	# 指定ユーザーの投稿データを変数に格納
    @book=Book.new
  end

  def edit
  	@user=User.find(params[:id])
    if @user==current_user
    else
      redirect_to user_path(current_user)
    end
  end

  def update
  	@user=User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice]='You have updetead user successfully.'
  	  redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image,:postcode, :prefecture_code, :address_city, :address_street, :address_building)
  end
end


