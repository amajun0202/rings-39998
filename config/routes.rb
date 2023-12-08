Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show do
    resource :likes, only: :show
  end
  root "locations#index"
  resources :locations do
    member do
      resource :likes,     only: [:create, :destroy]
      resources :comments, only: [:create, :show]
    end

    collection do
      get 'search'
      get 'random'
    end
  end

end
