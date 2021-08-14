Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#new'
  resources :sessions only[:new, :create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
    member do
      get :favorite
    end
  end
  resources :users, except: [:index] do
    member do
      get :favorite
    end
  end
end

# resources :sessions, only: [:new, :create, :destroy]