module Spree
  class Favorite < ActiveRecord::Base

    belongs_to :favorable, polymorphic: true
    belongs_to :user, class_name: Spree.user_class.to_s

    validates :favorable, presence: true
    validates :user, presence: true
    validates :user_id, uniqueness: { scope: [:favorable_id, :favorable_type], message: 'already favorited' }

  end
end
