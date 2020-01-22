Rails.application.routes.draw do


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  resources :users, only:[:show, :edit, :update, :destroy, :confirm, :followers, :following, :matching] do
    member do
      get :confirm, :following, :followers, :matching
    end
  end

  root 'statics#top'
  get 'statics/about'
  get 'statics/borrow'
  get 'statics/lend'
  resources :statics, only:[:top, :about, :borrow, :lend]

  resources :houses do
    member do
      get :confirm
    end
  end

  resources :relationships, only:[:new, :create, :destroy]

end