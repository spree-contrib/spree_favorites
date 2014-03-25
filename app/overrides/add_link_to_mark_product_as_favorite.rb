Deface::Override.new(
  :virtual_path => 'spree/products/show',
  :name => 'add_link_to_mark_product_as_favorite',
  :insert_after => "div[itemprop='description']",
  :text => %Q{
    <% if spree_user_signed_in? && spree_current_user.has_favorite_product?(@product.id) %>
      <%= link_to Spree.t(:remove_favorite), favorite_path(:id => @product.id), :method => :delete, :remote => true, :class => 'favorite_link' %>
    <% else %>
      <%= link_to Spree.t(:add_favorite), favorites_path(:id => @product.id), :method => :post, :remote => spree_user_signed_in?, :class => 'favorite_link' %>
    <% end %>
  }
)
