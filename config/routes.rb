Rails.application.routes.draw do
  resources :invoices
  resources :reports
  resources :clients
  root to: 'dashboard#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
