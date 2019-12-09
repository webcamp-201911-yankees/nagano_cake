Rails.application.routes.draw do
  resources :products

  resources :shipping_addresses

  devise_for :admins

  namespace :admin do
    resources :products
  end

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
