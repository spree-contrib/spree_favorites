object false
node(:count) { @favorites.count }
node(:total_count) { @favorites.total_count }
node(:current_page) { params[:page] ? params[:page].to_i : 1 }
node(:per_page) { params[:per_page] || Kaminari.config.default_per_page }
node(:pages) { @favorites.num_pages }
child(@favorites => :favorites) do
  extends "spree/api/favorites/show"
end
