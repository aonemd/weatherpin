Rails.application.routes.draw do
  get 'weather/show'

  root to: 'weather#show'

  namespace :api, default: { format: :json } do
    namespace :v1 do
      get 'current/:query_type', to: 'current_weather#show', constraints: {
        query_type: /(by_city|by_coord)/
      }
      get 'random', to: 'random_weather#show'
      post 'login', to: 'sessions#create'
    end
  end
end
