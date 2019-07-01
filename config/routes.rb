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
  get "search", to: "items#search"
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
  resources :items, only:[:index, :show,:create,:new,:destroy]
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
    get '/:id/show', to: 'purchase#show',as:"item_not_buy"
    get '/:id/index', to: 'purchase#index',as:"item_buy"
    post '/:id/pay', to: 'purchase#pay',as: "item_pay"
    get '/:id/done', to: 'purchase#done',as:"buy_done"
  end
end

  get "mypage/profile", to:"users#mypage_profile", as: "mypage/profile"

end

