Rails.application.routes.draw do
  get 'current', to: 'weather#current'
  get 'random', to: 'weather#random'

  root to: 'application#landing'
end
