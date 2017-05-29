class ProductsController < ApplicationController

  def index
    # 商品類型 / 品牌
    @category_groups = CategoryGroup.published
    #收藏
    if params[:favorite] == "yes"
      @products = current_user.products
    end
    # 判斷是否篩選分類
    if params[:category].present?
      @category_s = params[:category]
      @category = Category.find_by(name: @category_s)

      @products = Product.where(:category => @category.id).published.recent.paginate(:page => params[:page], :per_page => 12)

    # 判斷是否篩選類型
    elsif params[:group].present?
      @group_s = params[:group]
      @group = CategoryGroup.find_by(name: @group_s)

      @products = Product.joins(:category).where("categories.category_group_id" => @group.id).published.recent.paginate(:page => params[:page], :per_page => 12)

      # 預設顯示所有公開商品
      else
        @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @category_groups = CategoryGroup.published

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

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :category_id)
  end
end
