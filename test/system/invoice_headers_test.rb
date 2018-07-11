require "application_system_test_case"

class InvoiceHeadersTest < ApplicationSystemTestCase
  setup do
    @invoice_header = invoice_headers(:one)
  end

  test "visiting the index" do
    visit invoice_headers_url
    assert_selector "h1", text: "Invoice Headers"
  end

  test "creating a Invoice header" do
    visit invoice_headers_url
    click_on "New Invoice Header"

    fill_in "Customer", with: @invoice_header.Customer
    fill_in "Invoicedatetime", with: @invoice_header.InvoiceDateTime
    fill_in "State", with: @invoice_header.State
    click_on "Create Invoice header"

    assert_text "Invoice header was successfully created"
    click_on "Back"
  end

  test "updating a Invoice header" do
    visit invoice_headers_url
    click_on "Edit", match: :first

    fill_in "Customer", with: @invoice_header.Customer
    fill_in "Invoicedatetime", with: @invoice_header.InvoiceDateTime
    fill_in "State", with: @invoice_header.State
    click_on "Update Invoice header"

    assert_text "Invoice header was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice header" do
    visit invoice_headers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice header was successfully destroyed"
  end
end
