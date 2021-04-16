Rails.application.routes.draw do
  devise_for :admins
  root 'admins/articles#index'

  namespace :admins do
    namespace :articles do
      post 'csv_upload'
    end

    resources :articles do
      resources :comments
    end

    resources :catagories do
      resources :product_catagories
    end

    resources :articles do
      member do
        delete :delete_image
      end
    end
  end
end