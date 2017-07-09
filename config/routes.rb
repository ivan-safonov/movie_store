Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "movies#index"

  resources :movies

  resources :users do
    resources :reviews
  end
end
