Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
    	resources :articles, only: [:index, :show, :create, :update, :delete]
    	delete "/articles/:url", to: "articles#destroy", constraints: { url: /[^\/]+/ }, as: :articles_destroy_with_url
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
