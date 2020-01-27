Rails.application.routes.draw do
  root 'artists#index'
  get 'artists/', to: 'artists#index'
  get 'artists/:id', to: 'artists#show', as: :artist
  
  namespace :admin do
    root 'artists#index'
    get '/artists', to: 'artists#index', as: :all_artists
    get 'artists/new', to: 'artists#new', as: :new_artist
    get 'artists/:id', to: 'artists#show', as: :artist
    post 'artists', to: 'artists#create', as: :artists
    get 'artists/:id/edit', to: 'artists#edit', as: :edit_artist
    put 'artist/:id', to: 'artists#update', as: :update_artist
    delete 'artists/:id', to: 'artists#delete', as: :delete_artist
  end
end
