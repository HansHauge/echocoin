Rails.application.routes.draw do
  root 'home#show'

  post '/' => 'home#create', as: 'entries'
end
