Rails.application.routes.draw do
  root to: 'home_pages#show'
  get '/home', to: redirect('/')

  get '/about', to: 'static_pages#about'

  resources :projects, only: [:index, :show]

  namespace :admin do
    resources :projects
  end
end
