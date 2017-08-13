Rails.application.routes.draw do
  devise_for :users
  resources :people do
    resources :phone_numbers
    resources :emails
  end
  root to: 'people#index'
end
