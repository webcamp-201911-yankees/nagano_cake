Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :manager do
      devise_for :admin_customers, controllers: {
      sessions: 'client/admin_customers/sessions',
      registrations: 'client/admin_customers/registrations',
      passwords: 'client/admin_customers/passwords'
    }
  end

    scope module: 'site' do
    devise_for :customers, controllers: {
      sessions: 'site/customers/sessions',
      registrations: 'site/customers/registrations',
      passwords: 'site/customers/passwords'
    }
  end

end
