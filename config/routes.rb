Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  root to: 'posts#index'
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: :show do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
    get :favorites, on: :member
  end
end
