Rails.application.routes.draw do

  get 'customers/index'
  get 'customers/show'
  get 'customers/edit'
  namespace :admin do
    get 'test_admin/new'
    get 'customer/index'
  end

  devise_for :admins
  resources :products
  scope module: 'customers' do
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'
  }
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
