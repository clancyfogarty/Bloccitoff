Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :items
  end

  root to: 'users#show'
end
