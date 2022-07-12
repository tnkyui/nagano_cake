Rails.application.routes.draw do
  devise_for :admin, skip: [:registration, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  namespace :admin do
    root to: 'homes#top'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :show, :edit, :create, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'



  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/confirm'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
