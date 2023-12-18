# config/routes.rb
Rails.application.routes.draw do
  # if Rails.env.development?
  #   mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  # end
  
  # post "/graphql", to: "graphql#execute"

  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :projects, only: :index
  end

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :projects do
	  resources :milestones
	  resources :viewers
	end
  end

  post 'signin', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end