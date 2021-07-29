Rails.application.routes.draw do
  resources :users, only: [:index, :create]

  scope '/api' do
    post '/signup', to: 'users#create'
    post '/login', to: 'users#login'
  end
end
