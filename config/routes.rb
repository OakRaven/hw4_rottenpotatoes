Rottenpotatoes::Application.routes.draw do

  match '/movies/similar(/:id)', to: 'movies#find_similar_movies', as: 'similar'
  resources :movies

  root to: 'movies#index'

end
