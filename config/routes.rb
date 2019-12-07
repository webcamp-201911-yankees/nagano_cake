Rails.application.routes.draw do
  devise_for :admins

  scope module: 'customers' do
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'
  }
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
