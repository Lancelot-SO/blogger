Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create]
  end
  resources :posts, only: %i[index show new create] do
    resources :comments, only: %i[new create]
    resources :likes, only: [:create]
  end
  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end
    unauthenticated do
      root 'users#index', as: :unauthenticated_root
    end
  end
end