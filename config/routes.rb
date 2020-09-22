Rails.application.routes.draw do
  get '/my_page', to: 'pages#my_page'
  
  resources :categories
  
  devise_for :users

  resources :posts

  # resources :posts do
  #   resources :comments
  # end

  # resources :comments do
  #   resources :comments
  # end

  get '/not_found', to: 'pages#not_found'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'

  get '*path' => redirect('/not_found')

end
