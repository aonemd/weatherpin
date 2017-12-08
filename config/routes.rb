Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      get 'current', to: 'current_weather#show'
      get 'random', to: 'random_weather#show'
    end
  end

  root to: 'application#landing'
end
