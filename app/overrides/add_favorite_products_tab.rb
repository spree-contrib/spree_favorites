Deface::Override.new(
  :virtual_path => 'spree/admin/shared/sub_menu/_product',
  :name => 'add_favorite_products_tab',
  :insert_bottom => "ul#sidebar-product",
  :text => "<%= tab :favorites %>"
)