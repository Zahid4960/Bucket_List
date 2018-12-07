Rails.application.routes.draw do

  devise_for :users
  resources :buckets
  root "buckets#index"

  end
