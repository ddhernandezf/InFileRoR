require 'test_helper'

class InvoiceStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_state = invoice_states(:one)
  end

  test "should get index" do
    get invoice_states_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_state_url
    assert_response :success
  end

  test "should create invoice_state" do
    assert_difference('InvoiceState.count') do
      post invoice_states_url, params: { invoice_state: { Name: @invoice_state.Name } }
    end

    assert_redirected_to invoice_state_url(InvoiceState.last)
  end

  test "should show invoice_state" do
    get invoice_state_url(@invoice_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_state_url(@invoice_state)
    assert_response :success
  end

  test "should update invoice_state" do
    patch invoice_state_url(@invoice_state), params: { invoice_state: { Name: @invoice_state.Name } }
    assert_redirected_to invoice_state_url(@invoice_state)
  end

  test "should destroy invoice_state" do
    assert_difference('InvoiceState.count', -1) do
      delete invoice_state_url(@invoice_state)
    end

    assert_redirected_to invoice_states_url
  end
end
