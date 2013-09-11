Spree::Admin::OrdersController.class_eval do
  def export_csv
    created_at_gt = Time.zone.parse(params[:created_at_gt]).beginning_of_day rescue ""
    created_at_lt = Time.zone.parse(params[:created_at_lt]).end_of_day rescue ""

    @orders = Spree::Order.where('created_at between ? and ?', created_at_gt, created_at_lt).
      order(:created_at)
    @orders.where(state: params[:state_eq]) if params[:state_eq]

    send_data(@orders.export_csv, filename: "orders.csv") if @orders.present?
  end
end
