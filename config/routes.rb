Rails.application.routes.draw do
  devise_for :users
  get "users/show" => "users#show"
  root "locations#index"
  resources :locations do
    collection do
      get 'search'
      get 'random'
    end
  end
end
