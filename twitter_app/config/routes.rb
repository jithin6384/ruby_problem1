Rails.application.routes.draw do
	root "tweets#index"
  resources :tweets
  devise_for :users
  get 'follow', to: 'tweets#follow'
  get 'show_user', to: 'tweets#show_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
