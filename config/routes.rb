Rails.application.routes.draw do
  root 'doctors#index'
  resources :users
  resource :doctors do
    resource :doctors, only: [:index,:new,:create,:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
