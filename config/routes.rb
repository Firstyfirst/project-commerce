Rails.application.routes.draw do
  devise_for :admins
  root 'homes#index'

  resources :homes, only: :index

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

  namespace :api do
    namespace :v1 do
      resources :articles, only: [] do
        resources :comments, only: :index
      end
    end
  end
end