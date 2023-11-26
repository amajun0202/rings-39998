Rails.application.routes.draw do
  devise_for :users
  get "users/show" => "users#show"
  root "locations#index"
end
