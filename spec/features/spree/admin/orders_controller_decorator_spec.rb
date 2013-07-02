require 'spec_helper'

feature 'Spree Admin Orders Controller Export CSV' do
  stub_authorization!

  background do
    sign_in_as!(create(:admin_user))
    create_list(:completed_order_with_totals, 1)
    visit spree.admin_path
    click_link "Orders"
  end

  scenario "Clicking export" do
    click_link "Export CSV"
    expect(page).to_not be_blank
  end
end
