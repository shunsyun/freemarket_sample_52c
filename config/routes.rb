Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "items#index"
  resources :wallets, only: [:new]
  resources :items, only:[:index]
  get "items/delete" => "items#delete"
  get'items/mypage'=>'items#mypage'#マイページ画面

end