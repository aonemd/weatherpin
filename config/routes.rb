Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      get 'current/:query_type', to: 'current_weather#show', constraints: {
        query_type: /(by_city|by_coord)/
      }
      get 'random', to: 'random_weather#show'
    end
  end

  root to: 'weather#show'
end
