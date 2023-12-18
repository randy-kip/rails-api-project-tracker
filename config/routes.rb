Rails.application.routes.draw do
  resources :viewers
  resources :users
  resources :milestones
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post 'signin', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
