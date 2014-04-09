RedT::Application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/links/all', to: 'links#all'

  resources :users do
    resources :links, shallow: true
  end



  root 'links#index'

end
