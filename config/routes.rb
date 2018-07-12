Rails.application.routes.draw do
  resources :invoice_details
  resources :invoice_headers
  resources :invoice_states
  resources :products
  resources :customers
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
