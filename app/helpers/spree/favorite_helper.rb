module Spree
  module FavoriteHelper

    def favorite_count
      if try_spree_current_user
        try_spree_current_user.favorites.count
      elsif cookies.signed[:user_token].present?
        Spree::Favorite.where(user_token: cookies.signed[:user_token]).count
      else
        0
      end
    end

    def get_favorite(object)
      if try_spree_current_user
        try_spree_current_user.favorites.find_by_favorable_id_and_favorable_type(object.id, object.class.to_s)
      elsif cookies.signed[:user_token].present?
        Spree::Favorite.find_by_favorable_id_and_favorable_type_and_user_token(object.id, object.class.to_s, cookies.signed[:user_token])
      end
    end

    def has_favorite?(object)
      if try_spree_current_user
        try_spree_current_user.has_favorite?(object)
      elsif cookies.signed[:user_token].present?
        Favorite.exists? favorable_id: object.id, favorable_type: object.class.to_s, user_token: cookies.signed[:user_token]
      end
    end

  end
end
