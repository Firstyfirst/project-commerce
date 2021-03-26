Rails.application.routes.draw do
  devise_for :admins
  root 'articles#index'

  resources :articles do
    resources :comments
  end

  resources :catagories do
    resources :product_catagories
  end
end
