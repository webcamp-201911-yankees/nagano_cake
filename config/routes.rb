Rails.application.routes.draw do

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'
  }

  devise_for :admins, admins: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords'
  }


  resources :customers

  resources :products

  resources :shipping_addresses

  resources :carts, only: [:index,:create,:update,:destroy,]


  namespace :admin do
    resources :products
    resources :customers
  end

  resources :order_histories,only: [:index,:new,:create,:show,:edit,:update]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
