Rails.application.routes.draw do
  
  get 'requests/index'
  get 'requests/show'
  resources :requests, only: [:index, :show]


  # get 'request/index'
  # get 'request/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
