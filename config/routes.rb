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

  namespace :users do
    get 'mypage', to: 'users#mypage'
    get ':id', to: 'users#show'
    get ':id/edit', to: 'users#edit', as: 'edit_user'
    patch ':id', to: 'users#update', as: 'update_user'
    get '/users/check', to: 'users#check'
    patch  '/users/withdraw' => 'users#withdraw'
  end

  resources :comments
  resources :bars, only: [:new, :create, :index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
