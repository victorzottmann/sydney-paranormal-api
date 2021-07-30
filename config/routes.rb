Rails.application.routes.draw do
  
  scope '/api' do
    get '/pins', to: 'pins#index'
    post '/pins', to: 'pins#create'
    get '/pins/:id', to: 'pins#show'
    put '/pins/:id', to: 'pins#update'
    delete '/pins/:id', to: 'pins#destroy'
  end

end
