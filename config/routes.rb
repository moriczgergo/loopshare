Rails.application.routes.draw do
  get '/feed', to: 'feed#index'
  post '/feed', to: 'feed#post'
  root to: "home#index"
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
