Rails.application.routes.draw do
  root 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :pictures do
    collection do
      post :confirm
    end
    member do
      get :favorite
    end
    resources :comments
  end

  resources :users do
    member do
      get :favorite
    end
    member do
      get :relationship
    end
  end

  resources :conversations do
    resources :messages
  end

  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?

  resources :relationships, only: [:create, :destroy]

end
