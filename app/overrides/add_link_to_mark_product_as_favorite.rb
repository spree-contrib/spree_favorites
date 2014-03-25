Deface::Override.new(
  :virtual_path => 'spree/products/show',
  :name => 'add_link_to_mark_product_as_favorite',
  :insert_after => "div[itemprop='description']",
  :text => %Q{
    <% if try_spree_current_user && try_spree_current_user.has_favorite_product?(@product.id) %>
      <%= link_to Spree.t(:remove_favorite), favorite_path(try_spree_current_user.favorites.find_by_favorable_id_and_favorable_type(@product.id, 'Spree::Product'), favorable_id: @product.id, favorable_type: 'Spree::Product'), :method => :delete, :remote => true, :class => 'favorite_link' %>
    <% else %>
      <%= link_to Spree.t(:add_favorite), favorites_path(favorable_id: @product.id, favorable_type: 'Spree::Product'), :method => :post, :remote => spree_user_signed_in?, :class => 'favorite_link' %>
    <% end %>
  }
)
