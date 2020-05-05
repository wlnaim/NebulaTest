require 'test_helper'

class PagosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pago = pagos(:one)
  end

  test "should get index" do
    get pagos_url
    assert_response :success
  end

  test "should get new" do
    get new_pago_url
    assert_response :success
  end

  test "should create pago" do
    assert_difference('Pago.count') do
      post pagos_url, params: { pago: { pago_capital: @pago.pago_capital, pago_fecha: @pago.pago_fecha, pago_interes: @pago.pago_interes, pago_monto_periodico: @pago.pago_monto_periodico, pago_periodo: @pago.pago_periodo, pago_prestamo_saldo: @pago.pago_prestamo_saldo, prestamo_id: @pago.prestamo_id } }
    end

    assert_redirected_to pago_url(Pago.last)
  end

  test "should show pago" do
    get pago_url(@pago)
    assert_response :success
  end

  test "should get edit" do
    get edit_pago_url(@pago)
    assert_response :success
  end

  test "should update pago" do
    patch pago_url(@pago), params: { pago: { pago_capital: @pago.pago_capital, pago_fecha: @pago.pago_fecha, pago_interes: @pago.pago_interes, pago_monto_periodico: @pago.pago_monto_periodico, pago_periodo: @pago.pago_periodo, pago_prestamo_saldo: @pago.pago_prestamo_saldo, prestamo_id: @pago.prestamo_id } }
    assert_redirected_to pago_url(@pago)
  end

  test "should destroy pago" do
    assert_difference('Pago.count', -1) do
      delete pago_url(@pago)
    end

    assert_redirected_to pagos_url
  end
end
