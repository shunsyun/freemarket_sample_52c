Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "items#index"
  resources :wallets, only: [:new]
  resources :items, only:[:index, :show]
  resources :users, only:[:index, :show, :new] do
  collection do
    get "number"
    get "address"
    get "done"
    get "credit"
  end
end
  
  get "items/delete" => "items#delete"

  get "mypage", to: "items#mypage", as: "mypage"
  get "mypage/profile", to: "items#mypage_profile", as: "mypage/profile"
  get "sell", to: "items#sell", as: "sell"
  
end