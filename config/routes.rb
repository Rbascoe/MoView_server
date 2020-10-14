Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
      resources :movies, only: [:index]
      resources :reviews, only: [:index, :create, :update, :destroy]
      resources :ratings, only: [:create, :update]
      
      post "login", to: "authentication#login"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
