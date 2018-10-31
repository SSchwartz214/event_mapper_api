require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  
  namespace :api do
    namespace :v1 do
      
      resources :users, only: [:index, :create] do
        get 'events', to: 'user_events#index'
        post 'events', to: 'events#create'
        delete 'events/:id', to: 'user_events#destroy'
      end
    end 
  end
end
