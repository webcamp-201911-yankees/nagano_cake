Rails.application.routes.draw do

  # namespace :admin do
  #   get 'customer/show'
  #   get 'customer/edit'
  # end


  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'
  }

  devise_for :admins

  resources :products

  namespace :admin do
    resources :products
    resources :customers
    resources :categories do
      patch :toggle_status
    end
  end

  resources :customers
  resources :shipping_addresses

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
