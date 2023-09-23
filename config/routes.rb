Rails.application.routes.draw do

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
    resources :items, only: [:index,:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
