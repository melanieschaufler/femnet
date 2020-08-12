Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :requests, only: [:create, :destroy]
  end
  #   collection do
  #     get :mentors
  #   end
  # end   ## Einbau search in index for mentors

  resources :requests do
    collection do
      get :my_requests
    end
    member do
      get :accept
      get :ignore
    end
  end

  # resources :requests do
  #   member do
  #     get :accept
  #     get :ignore
  #   end
  # end

  # collection do
  #   get :my_mentors
  #   get :my_meentees
  # end
end
