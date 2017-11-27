Rails.application.routes.draw do
  devise_for :users
  resources :invoices
  resources :reports do
    collection do
      get "unbilled_reports_by_client"
    end
  end
  resources :clients
  root to: 'dashboard#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
