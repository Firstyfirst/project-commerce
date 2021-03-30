Rails.application.routes.draw do
  devise_for :admins
  root 'articles#index'

  namespace :articles do
    post 'csv_upload'
  end

  resources :articles do
    resources :comments
  end

  resources :catagories do
    resources :product_catagories
  end
end
