Rails.application.routes.draw do

  root "items#index"

  # Devise
  get 'users/settings', to: 'users#settings'

  devise_for :users, controllers: {
        registrations: 'users/registrations', 
        sessions: 'users/sessions',
        password: 'users/password'
      }
  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end

  # Items
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
