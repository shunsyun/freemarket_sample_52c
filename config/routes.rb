Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
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
  get "items/:id/buy",to: "items#buy",as:"item_buy"
  get "items/buy_done",to: "items#buy_done"
  post "items/pay",to: "items#pay"
  get "users/identification", to: "users#identification", as: "identification"
  get "mypage", to: "users#mypage", as: "mypage"
  resources :wallets, only:[:new, :show] do
    collection do
      get "paying"
      post 'show', to: 'wallets#show'
      post 'pay', to: 'wallets#pay'
      post 'delete', to: 'wallets#delete'
    end
  end

  resources :items, only:[:index, :show, :create, :new, :edit, :update]

  resources :users, only:[:index, :show, :new] do
  collection do
    get "number"
    get "address"
    get "done"
    get "credit"
  end
end
  resources :purchase, only: [:index, :show] do
  collection do
    get 'show', to: 'purchase#show'
    get 'index', to: 'purchase#index'
    post 'pay', to: 'purchase#pay'
    get 'done', to: 'purchase#done'
  end
end

  get "mypage/profile", to:"users#mypage_profile", as: "mypage/profile"

end

