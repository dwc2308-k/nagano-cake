Rails.application.routes.draw do

  namespace :public do
    get 'orders/index'
    get 'orders/show'
  end
  devise_for :users

  # 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items
  end

  # 顧客用
# URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :public do
     root "homes#top"
     get "/about" => "homes#about"
     get "/customers/unsubscribe" => "customers#unsubscribe"
     get "/customers/mypage" => "customers#show"
     get "/customers/information/edit" => "customers#edit"
     patch "/customers" => "customers#update"
     
     get "/orders/new" => "orders#new"
     post "/orders/confirm" => "orders#confirm"
     get "orders/thanks" => "orders#thanks"
     post "/orders" => "order#create"
     get "/orders" => "orders#index"
     get "/orders/:id" => "orders#show"
     
    resources :items, only: [:index,:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
