Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :api, default: { format: :json } do
    namespace :v1 do
      get 'current/:query_type', to: 'current_weather#show', constraints: {
        query_type: /(by_city|by_coord)/
      }
      get 'random', to: 'random_weather#show'
      post 'sign_in', to: 'sessions#create'
      post 'sign_up', to: 'registrations#create'

      resources :posts, only: [:index, :create]
    end
  end
end
