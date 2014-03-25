module Spree
  class Favorite < ActiveRecord::Base

    FAVORABLES_ALLOWED = [
      'Spree::Product'
    ]

    belongs_to :favorable, polymorphic: true
    belongs_to :user, class_name: Spree.user_class.to_s

    validates :favorable, presence: true
    validates :favorable_type, presence: true, inclusion: { in: FAVORABLES_ALLOWED }
    validates :user, presence: true
    validates :user_id, uniqueness: { scope: [:favorable_id, :favorable_type], message: 'Already added as favorite.' }

  end
end
