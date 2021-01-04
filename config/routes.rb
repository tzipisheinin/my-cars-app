Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/cars-list' => 'welcome#index'
  get '/view-car/:id' => 'welcome#index'
  get '/drivers-list' => 'welcome#index'
  get '/view-driver/:id' => 'welcome#index'
  get '/drivers-and-cars' => 'welcome#index'

  resources :cars
  resources :drivers

  get '/get-drivers-for-car/:id' => 'cars#get_drivers'
  get '/get-cars-for-driver/:id' => 'drivers#get_cars'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
