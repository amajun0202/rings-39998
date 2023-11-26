Rails.application.routes.draw do
  devise_for :users
  root "locations#index"
end
