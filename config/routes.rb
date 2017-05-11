Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  post 'users/confirm' => 'users#confirm' # I got this part on my own

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
