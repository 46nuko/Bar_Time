Rails.application.routes.draw do
  root to: "homes#top"

  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  get '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  devise_for :users, skip: [:passwords],controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
}
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admins/sessions"
}
  resources :comments
  resources :bars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
