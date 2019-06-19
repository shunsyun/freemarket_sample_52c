Rails.application.routes.draw do
  devise_for :users,:controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  devise_scope :user do
    get "sign_up", :to => "users/registrations#new"
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
   
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "items#index"
  resources :wallets, only: [:new]
  resources :items, only:[:index]
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
  
  
end