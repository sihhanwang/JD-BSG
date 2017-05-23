Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :products
    resources :categories
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  namespace :account do
    resources :orders
  end

  resources :products do
    member do
      post :add_to_cart
      post :add_to_favorite
      post :quit_favorite
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :orders do
    member do
      post :pay_with_alipy
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  resources :categories do
	   resources :products
   end

  resources :cart_items

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
