module Spree
  class Favorite < ActiveRecord::Base

    FAVORABLES_ALLOWED = [
      'Spree::Product'
    ]

    belongs_to :favorable, polymorphic: true
    belongs_to :user, class_name: Spree.user_class.to_s

    validates :favorable, presence: true
    validates :favorable_type, presence: true, inclusion: { in: FAVORABLES_ALLOWED }

    validates :user_id, uniqueness: { allow_blank: true, message: 'Already added as favorite.', scope: [:favorable_id, :favorable_type] }
    validates :user_token, uniqueness: { allow_blank: true, message: 'Already added as favorite.', scope: [:favorable_id, :favorable_type] }

    scope :by_user_token, -> (token) { where(user_token: token) }

  end
end
