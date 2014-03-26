module Spree
  class FavoritesController < Spree::StoreController

    before_filter :find_favorite, only: [:destroy]

    def index
      if try_spree_current_user
        @favorites = spree_current_user.favorites.page(params[:page]).per(Spree::Config.favorites_per_page)
      elsif cookies.signed[:user_token].present?
        @favorites = Favorite.by_user_token(cookies[:user_token]).page(params[:page]).per(Spree::Config.favorites_per_page)
      else
        @favorites = []
      end
    end

    def create
      @favorable_id   = params[:favorable_id]
      @favorable_type = params[:favorable_type]

      if try_spree_current_user
        @favorite = try_spree_current_user.favorites.new favorable_id: @favorable_id, favorable_type: @favorable_type
      elsif cookies.signed[:user_token].present?
        @favorite = Favorite.new favorable_id: @favorable_id, favorable_type: @favorable_type, user_token: cookies.signed[:user_token]
      else
        user_token = loop do
          random_token = SecureRandom.urlsafe_base64(nil, false)
          break random_token unless Favorite.exists?(user_token: random_token)
        end
        cookies.permanent.signed[:user_token] = user_token
        @favorite = Favorite.new favorable_id: @favorable_id, favorable_type: @favorable_type, user_token: cookies.signed[:user_token]
      end

      if @success = @favorite.save
        @message = Spree.t(:successfully_added_favorite)
      else
        @message = @favorite.errors.full_messages.to_sentence
      end

      respond_to do |format|
        format.js
      end
    end

    def destroy
      if @favorite
        @favorable_id   = @favorite.favorable_id
        @favorable_type = @favorite.favorable_type
        @success        = @favorite.destroy
      end
    end

    private

      def find_favorite
        if try_spree_current_user
          @favorite = try_spree_current_user.favorites.find(params[:id])
        else
          @favorite = Favorite.by_user_token(cookies.signed[:user_token]).find(params[:id])
        end
      end

  end
end
