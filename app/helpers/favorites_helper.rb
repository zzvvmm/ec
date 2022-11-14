module FavoritesHelper
  def favorite_text
    return @favorite_exists ? "UnFavorite" : "Favorite"
  end
end
