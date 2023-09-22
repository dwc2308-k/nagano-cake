Rails.application.routes.draw do
  namespace :public do
    get 'customers/edit'
    get 'customers/show'
    get 'customers/unsubscribe'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :customers
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
