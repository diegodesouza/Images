Rails.application.routes.draw do
  root 'images#index'
  devise_for :users

  resources :images do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

end
