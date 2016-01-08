object @favorite

child :favorable do |u|
  if u.is_a?(Spree::Product)
    extends "spree/api/products/show"
  end
end
