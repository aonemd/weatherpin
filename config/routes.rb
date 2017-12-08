Rails.application.routes.draw do
  get 'current', to: 'weather#current'
  root to: 'weather#current'
end
