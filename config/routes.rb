Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  namespace :public do
     resources :customers, only: [:show, :edit, :update,:unsubscribe]
     resources :homes, only: [:top,:about]
    resources :items, only: [:index,:show]
  end

  devise_for :customers
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
