Rails.application.routes.draw do
  resources :users
  resources :posts do
    resources :comments
  end
  resource :session
  root to: 'posts#index'
end
