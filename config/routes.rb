Rails.application.routes.draw do
  devise_for :users,controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  } 
  devise_scope :user do
    get "sign_up", to: "users/registrations#new"
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy" 
  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "items#index"
  get "users/delete",to: "users#delete"
  get "users/identification", to: "users#identification", as: "identification"
  get "mypage", to: "users#mypage", as: "mypage"
  resources :wallets, only: [:new]
  resources :items, only:[:index, :show] do
    collection do
      get "buy"
      get "buy_done"
      post "pay"
    end
end

  resources :users, only:[:index, :show, :new] do
    collection do
      get "number"
      get "address"
      get "done"
      get "credit"
    end
end
  get "mypage/profile", to:"items#mypage_profile", as: "mypage/profile"
  get "sell", to: "items#sell", as: "sell"
  
end

