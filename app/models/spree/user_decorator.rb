Spree.user_class.class_eval do

  has_many :favorites, class_name: 'Spree::Favorite'
  has_many :favorite_products, through: :favorites, class_name: 'Spree::Product', source: :favorable, source_type: 'Spree::Product'

  def has_favorite_product?(product_id)
    favorites.exists? favorable_id: product_id, favorable_type: 'Spree::Product'
  end

end
