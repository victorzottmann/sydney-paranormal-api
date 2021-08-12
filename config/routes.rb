Rails.application.routes.draw do

  resources :users, only: [:index, :create]
  resources :pins, only: [:index, :show, :create]
  
  scope '/api' do
    post '/signup', to: 'users#create'
    post '/login', to: 'users#login'
    get '/get_user', to: 'users#get_user'
    
    post '/add_pin', to: 'pins#create'
    
    get '/pin_families/:id', to: 'pin_families#show'

    resources :notes  
    resources :comments
  end

end
