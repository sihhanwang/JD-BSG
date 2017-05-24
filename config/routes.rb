Rails.application.routes.draw do
  devise_for :users
  #--=== 首頁 ===--#
  root 'welcome#index'
  #--=== 前台 ===--#

   # 商品 #
  resources :products do
    member do
      post :add_to_cart
      post :add_to_favorite
      post :quit_favorite
    end
  end

   # 購物車 #
  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

   # 訂單 #
  resources :orders do
    member do
      post :pay_with_alipy
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  resources :cart_items

  #--=== 使用者專區 ===--#
  namespace :account do

     # 訂單記錄 #
    resources :orders

  end
  #--=== 管理員專區 ===--#

  namespace :admin do

      # 產品 #
    resources :products

    # 類型 #
    resources :category_groups do
      member do
        post :publish
        post :hide
      end
    end

    # 分類 #
    resources :categories do
      member do
        post :publish
        post :hide
      end
    end

      # 訂單管理 #
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end

  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
