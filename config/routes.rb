Rails.application.routes.draw do

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'
  }

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords'
  }


  resources :customers
  resources :products
  resources :shipping_addresses
  resources :order_histories,only: [:index,:new,:create,:show,:edit,:update]

  get 'carts/confirm' => 'carts#confirm'
  get 'carts/complete' => 'carts#complete'
  delete 'carts/destroy_all' => 'carts#destroy_all'
  resources :carts, only: [:index,:new,:create,:edit,:update,:destroy]


  namespace :admin do
    root :to => 'products#top'
    resources :products
    resources :order_histories
    resources :customers do
      patch :toggle_status
    end
    resources :categories do
      patch :toggle_status
    end
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
