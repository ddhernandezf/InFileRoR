require "application_system_test_case"

class InvoiceDetailsTest < ApplicationSystemTestCase
  setup do
    @invoice_detail = invoice_details(:one)
  end

  test "visiting the index" do
    visit invoice_details_url
    assert_selector "h1", text: "Invoice Details"
  end

  test "creating a Invoice detail" do
    visit invoice_details_url
    click_on "New Invoice Detail"

    fill_in "Header", with: @invoice_detail.Header
    fill_in "Price", with: @invoice_detail.Price
    fill_in "Product", with: @invoice_detail.Product
    fill_in "Quantity", with: @invoice_detail.Quantity
    click_on "Create Invoice detail"

    assert_text "Invoice detail was successfully created"
    click_on "Back"
  end

  test "updating a Invoice detail" do
    visit invoice_details_url
    click_on "Edit", match: :first

    fill_in "Header", with: @invoice_detail.Header
    fill_in "Price", with: @invoice_detail.Price
    fill_in "Product", with: @invoice_detail.Product
    fill_in "Quantity", with: @invoice_detail.Quantity
    click_on "Update Invoice detail"

    assert_text "Invoice detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice detail" do
    visit invoice_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice detail was successfully destroyed"
  end
end
