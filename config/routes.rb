Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: redirect('/songs')
  get '/songs', to: 'songs#index'
  get '/songs/new', to: 'songs#new'
  get '/songs/:id', to: 'songs#show'
  post '/songs', to: 'songs#create'
  delete '/songs/:id', to: 'songs#delete'
  get '/songs/:id/edit', to: 'songs#edit'
  patch '/songs/:id', to: 'songs#update'
  # resources :songs

  post '/songs/:id/favorites', to: 'favorites#create'
  delete '/songs/:id/favorites', to: 'favorites#delete'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
end
