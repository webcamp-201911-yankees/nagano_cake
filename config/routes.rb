Rails.application.routes.draw do
  # namespace :admin do
  #   get 'customer/show'
  #   get 'customer/edit'
  # end
  resources :products

  resources :shipping_addresses

  devise_for :admins

  namespace :admin do
    resources :products
    resources :customers
  end

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
