Spree::AppConfiguration.class_eval do
  # How many favorites to show per page.
  preference :favorites_per_page, :integer, default: 10
end
