Rails.application.routes.draw do
	root "tweets#index"
  resources :tweets
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
