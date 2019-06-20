Rails.application.routes.draw do
  root to: 'home_pages#show'
  get '/home', to: redirect('/')
  get '/about', to: 'static_pages#about'
end
