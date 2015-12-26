Rails.application.routes.draw do
  root 'home#show'

  get '/terms' => 'home#terms'
  get '/about' => 'home#about'
  post '/' => 'home#create', as: 'entries'
  get '/prize/jackpot' => 'prize#jackpot'

  namespace :api do
    get 'address/:btc_address/balance' => 'block_explorer#check_balance'
  end
end
