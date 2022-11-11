class ProductsController < ApplicationController
  def show
    @rates = Rate.rate_product(params[:id])
    @favorite_exists = Favorite.where(product: @product, user: current_user) == [] ? false : true
    @product = Product.find_by id: params[:id]
    return if @product.present?

    flash[:danger] = t "flash.not_found_product"
    redirect_to root_url
  end
end
