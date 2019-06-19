Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "items#index"
  resources :wallets, only: [:new]
  resources :items, only:[:index, :show]
  get "items/delete" => "items#delete"
  # resources :items, only: :mypage do
  #   collection do
  get "mypage", to: "items#mypage", as: "mypage"
  #   end
  # end
end