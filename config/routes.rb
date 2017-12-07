Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      get 'current', to: 'weather#current'
    end
  end

  root to: 'api/v1/weather#current'
end
