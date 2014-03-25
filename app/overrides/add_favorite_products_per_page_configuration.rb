Deface::Override.new(
  :virtual_path => 'spree/admin/general_settings/edit',
  :name => 'add_favorite_products_per_page_configuration',
  :insert_after => "#preferences .row",
  :text => %Q{
    <div class="row">
      <fieldset class="no-border-bottom">
        <legend align="center"><%= Spree.t(:favorites_settings) %></legend>
        <div class="field">
          <%= label_tag :favorites_per_page, Spree.t(:favorites_per_page) %><br>
          <%= text_field_tag :favorites_per_page, Spree::Config[:favorites_per_page], :size => 3 %>
        </div>
      </fieldset>
    </div>
  }
)