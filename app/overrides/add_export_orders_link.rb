Deface::Override.new(
  :virtual_path => 'spree/admin/orders/index',
  :name => 'add_export_orders_link',
  :insert_before => "#listing_orders",
  :text => "
    <% if params[:q][:created_at_gt].present? && params[:q][:created_at_lt].present? %>
      <%= link_to 'Export as CSV', spree.export_csv_path(params[:q]), class: 'button', id: 'export_csv' %>
    <% end %>
  ")

