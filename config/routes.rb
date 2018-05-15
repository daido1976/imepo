Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get '/posts',  to: 'posts#new'
  resources :posts, only: [:new, :create, :destroy, :edit, :update ] do
    resources :funs, only: [:create, :destroy]
    resources :scares, only: [:create, :destroy]
    resources :worsts, only: [:create, :destroy]
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/lo"
  end
end
