Rails.application.routes.draw do
  get 'favorites/show'
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :songs, only: [:index, :show, :edit, :update, :create, :destroy]do
    resources :post_comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end
  resources :songs do
  member do
    get :favorites
  end
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
