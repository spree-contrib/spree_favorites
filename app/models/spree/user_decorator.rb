Spree.user_class.class_eval do

  has_many :favorites, class_name: 'Spree::Favorite'
  has_many :favorite_products, through: :favorites, class_name: 'Spree::Product', source: :favorable, source_type: 'Spree::Product'

  def has_favorite?(object)
    favorites.exists? favorable_id: object.id, favorable_type: object.class.to_s
  end

end
