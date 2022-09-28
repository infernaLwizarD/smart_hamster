Rails.application.routes.draw do

  authenticated :user do
    root to: "home#index", as: :authenticated_root
  end
  root to: redirect("/users/sign_in")

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
