Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  get 'users/:id/profile', to: 'posts#profile', as: :profile
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
