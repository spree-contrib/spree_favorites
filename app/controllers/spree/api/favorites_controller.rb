module Spree
  module Api
    class FavoritesController < Spree::Api::BaseController


      # GET api/favorites.json?token=TOKEN
      def index
        @favorites = @current_api_user.favorites.page(params[:page]).per(params[:per_page])
      end

      # POST api/favorites.json?token=TOKEN&product_id=PRODUCT_ID
      def create
        @favorite = @current_api_user.favorites.new favorable_id: params[:product_id], favorable_type: "Spree::Product"

        @success = @favorite.save
        status = @success ? 200 : 422

        render :status => status
      end

      # DELETE api/favorites/unfavorite.json?token=TOKEN&product_id=PRODUCT_ID
      def unfavorite
        @favorite = @current_api_user.favorites.find_by(favorable_id: params[:product_id], favorable_type: "Spree::Product")
        
        status = 422
        if @favorite
          @success = @favorite.destroy ? true : false
          status = @success ? 200 : 422
        end
        render :status => status
      end
    end
  end
end
