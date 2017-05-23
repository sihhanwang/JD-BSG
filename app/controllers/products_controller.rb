class ProductsController < ApplicationController
  def index
    @products = Product.all
    if params[:favorite] == "yes"
      @products = current_user.products
    end

    if params[:category_id].blank?
    @products = Product.all
    else
    @products = Product.where(category_id: params[:category_id])
    end

  end
  def new
     @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
     @product.category_id = params[:category_id]
  end
  
  def edit
     @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
     @product.category_id = params[:category_id]
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
    flash[:notice] = "已將 #{@product.title} 加入購物車"
  else
    flash[:warning] = "你的購物車內已有此物品"
  end
    redirect_to :back
  end

  def add_to_favorite
    @product = Product.find(params[:id])
    @product.users << current_user
    @product.save
    redirect_to :back, notice:"成功加入收藏!"
  end
  def quit_favorite
    @product = Product.find(params[:id])
    @product.users.delete(current_user)
    @product.save
    redirect_to :back, notice: "已取消收藏!"
  end
end
