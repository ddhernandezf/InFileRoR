require 'test_helper'

class InvoiceDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_detail = invoice_details(:one)
  end

  test "should get index" do
    get invoice_details_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_detail_url
    assert_response :success
  end

  test "should create invoice_detail" do
    assert_difference('InvoiceDetail.count') do
      post invoice_details_url, params: { invoice_detail: { Header: @invoice_detail.Header, Price: @invoice_detail.Price, Product: @invoice_detail.Product, Quantity: @invoice_detail.Quantity } }
    end

    assert_redirected_to invoice_detail_url(InvoiceDetail.last)
  end

  test "should show invoice_detail" do
    get invoice_detail_url(@invoice_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_detail_url(@invoice_detail)
    assert_response :success
  end

  test "should update invoice_detail" do
    patch invoice_detail_url(@invoice_detail), params: { invoice_detail: { Header: @invoice_detail.Header, Price: @invoice_detail.Price, Product: @invoice_detail.Product, Quantity: @invoice_detail.Quantity } }
    assert_redirected_to invoice_detail_url(@invoice_detail)
  end

  test "should destroy invoice_detail" do
    assert_difference('InvoiceDetail.count', -1) do
      delete invoice_detail_url(@invoice_detail)
    end

    assert_redirected_to invoice_details_url
  end
end
