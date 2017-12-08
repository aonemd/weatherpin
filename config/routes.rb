Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      get 'current', to: 'weather#current'
      get 'random', to: 'weather#random'
    end
  end

  root to: 'application#landing'
end
