Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users

  resources :user_interests


  #   collection do
  #     get :mentors
  #   end
  # end   ## Einbau search in index for mentors


end
