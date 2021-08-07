Rails.application.routes.draw do

  resources :users, only: [:index, :create]
  resources :locations, only: [:index, :show, :create]
  
  scope '/api' do
    post '/signup', to: 'users#create'
    post '/login', to: 'users#login'
    get '/get_user', to: 'users#get_user'

    post '/add_location', to: 'locations#create'
    
    resources :pins
    # get '/pins', to: 'pins#index'
    # post '/pins', to: 'pins#create'
    # get '/pins/:id', to: 'pins#show'
    # put '/pins/:id', to: 'pins#update'
    # delete '/pins/:id', to: 'pins#destroy'

    get '/pin_families/:id', to: 'pin_families#show'

    resources :notes
    # get '/notes', to: 'notes#index'
    # post '/notes', to: 'notes#create'
    # get '/notes/:id', to: 'notes#show'
    # put '/notes/:id', to: 'notes#update'
    # delete '/notes/:id', to: 'notes#destroy'    
    
    resources :comments
    # get '/comments', to: 'comments#index'
    # post '/comments', to: 'comments#create'
    # get '/comments/:id', to: 'comments#show'
    # put '/comments/:id', to: 'comments#update'
    # delete '/comments/:id', to: 'comments#destroy'
  end

end
