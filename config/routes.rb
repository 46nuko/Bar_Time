Rails.application.routes.draw do
  root to: "homes#top"

  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  get '/homes/guest_sign_in', to: 'homes#guest_sign_in'

   devise_for :users, skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admins/sessions"
  }

  get 'search', to: 'searches#search'

  namespace :admins do
    resources :admins, only: [:index, :show, :edit]
    resources :tags, only:[:index, :create, :show, :edit, :update, :destroy]
  end
  namespace :users do
    get 'mypage', to: 'users#mypage'
    get '/users/:id/check', to: 'users#check', as: 'check'
    patch '/users/:id/withdraw', to: 'users#withdraw', as: 'withdraw'
    resources :users, only: [:show, :edit, :update]
  end

  resources :comments, only: [:new, :index, :create, :show, :edit, :update, :destroy] do
    collection do
      get :admin_index
      delete 'admin_destroy/:id', to: 'comments#admin_destroy', as: 'admin_destroy'
    end
  end

  resources :bars, only: [:index, :show, :create] do
     collection do
      get :admin_index
      get 'admin_edit/:id', to: 'bars#admin_edit', as: 'admin_edit'
      delete 'admin_destroy/:id', to: 'bars#admin_destroy', as: 'admin_destroy'
      patch 'admin_update/:id', to: 'bars#admin_update', as: 'admin_update'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
