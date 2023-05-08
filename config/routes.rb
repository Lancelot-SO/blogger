Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  get "/users" , to: "users#index",  as: "users"
  get "/users/:id" , to: "users#show" , as: 'user'
  get "/users/:id/posts" , to: "posts#index", as: "user_posts"
  get "/users/:id/posts/:id" , to: "posts#show", as: "user_post"
end
