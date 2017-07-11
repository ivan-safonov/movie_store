Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "movies#index"

  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  resources :users do
    resources :reviews, only: [:show]
    resources :comments

  end

  post 'upvote', to: 'votes#upvote', as: 'upvote'
  post 'downvote', to: 'votes#downvote', as: 'downvote'
end
