class FavoritesController < ApplicationController
  def create
    @favorite = Favorite(favorited: @product, user_id: current_user.id)
    respond_to do |format| 
      if @favorite.save
        flash.now[:success] = "You have successfully added this product to your favorites list"
        format.js { render 'favorite.js.erb' }
      else
        flash.now[:alert] = "Something when wrong!"
        format.js { render 'favorite.js.erb'}
      end
    end
  end

  def destroy
    @favorite = Favorite.where(favorited_id: @product.id, user_id: current_user.id)
    respond_to do |format|
      @favorite.first.destroy
      flash[:now] = "You have successfully removed this product from your favorites list"
      format.js { render 'favorite.js.erb'}
    end
  end
end
