module Spree
  StoreController.class_eval do

    helper_method :favorite_count,
                  :get_favorite,
                  :has_favorite?

    private

    def favorite_count
      if try_spree_current_user
        try_spree_current_user.favorites.count
      elsif cookies.signed[:guest_token].present?
        Spree::Favorite.where(guest_token: cookies.signed[:guest_token]).count
      else
        0
      end
    end

    def get_favorite(object)
      if try_spree_current_user
        try_spree_current_user.favorites.find_by_favorable_id_and_favorable_type(object.id, object.class.to_s)
      elsif cookies.signed[:guest_token].present?
        Spree::Favorite.find_by_favorable_id_and_favorable_type_and_guest_token(object.id, object.class.to_s, cookies.signed[:guest_token])
      end
    end

    def has_favorite?(object)
      if try_spree_current_user
        try_spree_current_user.has_favorite?(object)
      elsif cookies.signed[:guest_token].present?
        Favorite.exists? favorable_id: object.id, favorable_type: object.class.to_s, guest_token: cookies.signed[:guest_token]
      end
    end

  end
end
