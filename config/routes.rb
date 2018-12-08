Rails.application.routes.draw do
  devise_for :users
  resources :buckets do
  	member do
  		put "like",    to: "buckets#upvote"
  	end
  end

  root "buckets#index"
end