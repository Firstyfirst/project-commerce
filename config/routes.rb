Rails.application.routes.draw do
  devise_for :admins
  root 'articles#user_index'
  get 'articles/admin', to: 'articles#admin_index'

  resources :articles do
    resources :comments
  end
end
