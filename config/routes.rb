Rails.application.routes.draw do
  resources :line_items
  resources :carts
  namespace :admin do
      resources :users
      resources :categories
      resources :posts

      root to: "posts#index"
    end
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  resources :posts do
    collection do
      get 'phone'
      get 'laptop'
      get 'headphone'
    end
  end

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
