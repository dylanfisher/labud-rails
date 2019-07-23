Rails.application.routes.draw do
  # TODO: sort these new admin routes
  namespace :admin do
    resources :brush_strokes
  end
  root to: 'home_pages#show'
  get '/home', to: redirect('/')

  resources :projects, only: [:index, :show]
  resources :brush_strokes, only: [:create]

  namespace :admin do
    resources :brush_strokes
    resources :projects
  end
end
