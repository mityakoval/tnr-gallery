Rails.application.routes.draw do
  namespace :admin do
    get 'sessions/new'
  end
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/delete'
  get 'artworks/index'
  get 'artworks/show'
  root 'artists#index'
  get 'artists/', to: 'artists#index'
  get 'artists/:id', to: 'artists#show', as: :artist
  
  namespace :admin do
    root 'artists#index'
    
    get 'login', to: 'sessions#new', as: :login
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#delete', as: :logout
    
    get '/artists', to: 'artists#index', as: :all_artists
    get 'artists/new', to: 'artists#new', as: :new_artist
    get 'artists/:id', to: 'artists#show', as: :artist
    post 'artists', to: 'artists#create', as: :artists
    get 'artists/:id/edit', to: 'artists#edit', as: :edit_artist
    patch 'artists/:id', to: 'artists#update', as: :update_artist
    delete 'artists/:id', to: 'artists#delete', as: :delete_artist
    
    get '/artworks/index', to: 'artworks#index', as: :all_artworks
    get '/artists/:artist_id/artworks/:id', to: 'artworks#show', as: :artwork
    post '/artists/:artist_id/artworks', to: 'artworks#create', as: :artworks
    get 'artworks/:id/edit', to: 'artworks#edit', as: :edit_artwork
    patch 'artworks/:id', to: 'artworks#update', as: :update_artwork
    delete '/artists/:artist_id/artworks/:id', to: 'artworks#delete', as: :delete_artwork
  end
end
