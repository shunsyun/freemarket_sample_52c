Rails.application.routes.draw do
  devise_for :users,controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  } 
  devise_scope :user do
    get "sign_up", to: "users/registrations#new"
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy" 
  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "items#index"
  get "users/delete",to: "users#delete"
  get "items/buy",to: "items#buy"
  get "items/buy_done",to: "items#buy_done"
  post "items/pay",to: "items#pay"
  get "users/identification", to: "users#identification", as: "identification"
  get "mypage", to: "users#mypage", as: "mypage"
  resources :wallets, only: [:new]
  resources :items, only:[:index, :show,:create,:new]
  resources :users, only:[:index, :show, :new] do
  collection do
    get "number"
    get "address"
    get "done"
    get "credit"
  end
end
  get "mypage/profile", to:"items#mypage_profile", as: "mypage/profile"
end

