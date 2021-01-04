Rails.application.routes.draw do
  root to: 'welcome#index'
  # resources :cars
  
  # get 'app', to: 'cars#index'
  get 'welcome/index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
