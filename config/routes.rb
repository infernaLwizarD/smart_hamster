Rails.application.routes.draw do
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  scope '/admin' do
    resources :users, except: %i[show edit update destroy]
  end
  resources :users, only: %i[show edit update destroy]
end
