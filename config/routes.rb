Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
  		root :to => "devise/registrations#top"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books,  only: [:new, :create, :show, :index, :edit, :destroy, :update] do
    resources :post_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  get 'home/about' => 'homes#about', as: 'home_about'
  post 'follow/:id' =>'relationships#follow',as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow',as:'unfollow'
  get 'followerindex/:id' => 'relationships#followerindex',as:'follower_all'
  get 'followedindex/:id' => 'relationships#followedindex',as:'followed_all'
  get 'search' => "searchs#search",as:'search'
end
