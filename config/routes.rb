Rails.application.routes.draw do

  namespace :api do 
    namespace :v1 do 
      get '/ideas/recently-commented', to: 'ideas#recently_commented'
      resources :ideas, only: [:index, :show, :create] do
        resources :comments, only: [:index]
      end
      resources :comments, only: [:create]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
