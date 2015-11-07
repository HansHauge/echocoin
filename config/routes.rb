Rails.application.routes.draw do
  root 'home#show'

  get '/terms' => 'home#terms'
  post '/' => 'home#create', as: 'entries'
end
