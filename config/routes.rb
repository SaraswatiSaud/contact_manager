Rails.application.routes.draw do
  resources :people do
    resources :phone_numbers
    resources :emails
  end
  root to: 'people#index'
end
