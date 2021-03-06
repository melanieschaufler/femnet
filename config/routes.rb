Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :user_interests

  resources :users do
    resources :requests, only: [:create, :destroy]
  end

  resources :requests do
    collection do
      get :my_requests
    end
    member do
      get :accept
      get :ignore
    end
   resources :chatrooms, only: [:create, :show]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :dashboard, only: :index

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
  mount ActionCable.server => "/cable"
end
