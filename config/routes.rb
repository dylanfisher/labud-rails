Rails.application.routes.draw do
  root to: 'pages#show'
  # get '/home', to: redirect('/')
end
