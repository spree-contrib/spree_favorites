module Spree
  class FavoritesController < Spree::StoreController

    before_filter :authenticate_spree_user!
    before_filter :find_favorite, :only => :destroy

    def index
      @favorites = spree_current_user.favorite_products.page(params[:page]).per(Spree::Config.favorites_per_page)
    end

    def create
      favorite = spree_current_user.favorites.new favorable_id: params[:favorable_id], favorable_type: params[:favorable_type]
      if @success = favorite.save
        @message = Spree.t(:successfully_added_favorite)
      else
        @message = favorite.errors.full_messages.to_sentence
      end
      respond_to do |format|
        format.js
      end
    end

    def destroy
      if @favorite
        @success = @favorite.destroy
      end
    end

    private

      def find_favorite
        @favorite = spree_current_user.favorites.find(params[:id])
      end

  end
end
