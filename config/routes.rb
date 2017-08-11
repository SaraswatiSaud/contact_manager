Rails.application.routes.draw do
  resources :people do
    resources :phone_numbers
  end
  root to: 'people#index'
end
