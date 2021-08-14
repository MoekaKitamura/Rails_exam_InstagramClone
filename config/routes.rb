Rails.application.routes.draw do
  root 'users#new'
  resources :pictures do
    collection do
      post :confirm, :favorite
    end
  end
  resources :users, except: [:index] 
end

# resources :sessions, only: [:new, :create, :destroy]