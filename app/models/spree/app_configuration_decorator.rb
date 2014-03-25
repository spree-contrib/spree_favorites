Spree::AppConfiguration.class_eval do
  preference :favorites_per_page, :integer, default: 10
end
