Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "movies#index"

  resources :movies do
    resources :reviews
  end

  resources :users
end
