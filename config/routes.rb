Rails.application.routes.draw do
  scope '/auth' do
    get '/users', to: 'users#index'
    post '/sign_up', to: 'users#create'
  end
end
