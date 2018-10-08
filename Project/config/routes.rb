Rails.application.routes.draw do


  resources :requests, only: [:index, :show]

  root to: 'requests#index'

  # get 'request/index'
  # get 'request/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
