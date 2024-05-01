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
    get '/users/:id/check', to: 'users#check', as: 'check'
    patch '/users/:id/withdraw', to: 'users#withdraw', as: 'withdraw'
    resources :users, only: [:show, :edit, :update]
  end

  resources :comments
  resources :bars, only: [:new, :create, :index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
