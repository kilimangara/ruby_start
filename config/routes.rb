Rails.application.routes.draw do
  resources :users, only: [:create]

  resources :posts do
    resources :comments
  end

  resource :confirmation

  get 'login' => 'sessions#new'
  get 'register' => 'users#new'
  delete 'logout' => 'sessions#destroy'


  resource :session, only: [:create]

  root to: 'posts#index'
end
