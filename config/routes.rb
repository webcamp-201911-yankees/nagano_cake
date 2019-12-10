Rails.application.routes.draw do

  # namespace :admin do
  #   get 'customer/show'
  #   get 'customer/edit'
  # end

  devise_for :admins
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'
  }




  namespace :admin do
    resources :products
    resources :customers
  end

  resources :products
  resources :customers
  resources :shipping_addresses
  resources :order_histories,only: [:index,:new,:create,:show,:edit,:update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
