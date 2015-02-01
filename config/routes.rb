Rails.application.routes.draw do
  root 'images#index'

  namespace :admin do
    resources :users, only: []
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :images do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end
end
