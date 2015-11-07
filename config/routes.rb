Rails.application.routes.draw do
  root 'home#show'

  post '/' => 'entry#create', as: 'entries'
end
