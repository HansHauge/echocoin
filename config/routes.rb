Rails.application.routes.draw do
  root 'home#show'

  get '/terms' => 'home#terms'
  get '/about' => 'home#about'
  post '/' => 'home#create', as: 'entries'
end
