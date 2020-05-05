require 'test_helper'

class DispersionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dispersione = dispersiones(:one)
  end

  test "should get index" do
    get dispersiones_url
    assert_response :success
  end

  test "should get new" do
    get new_dispersione_url
    assert_response :success
  end

  test "should create dispersione" do
    assert_difference('Dispersione.count') do
      post dispersiones_url, params: { dispersione: { cantidad: @dispersione.cantidad, fechaalta: @dispersione.fechaalta, prestamo_id: @dispersione.prestamo_id, usuario_id: @dispersione.usuario_id } }
    end

    assert_redirected_to dispersione_url(Dispersione.last)
  end

  test "should show dispersione" do
    get dispersione_url(@dispersione)
    assert_response :success
  end

  test "should get edit" do
    get edit_dispersione_url(@dispersione)
    assert_response :success
  end

  test "should update dispersione" do
    patch dispersione_url(@dispersione), params: { dispersione: { cantidad: @dispersione.cantidad, fechaalta: @dispersione.fechaalta, prestamo_id: @dispersione.prestamo_id, usuario_id: @dispersione.usuario_id } }
    assert_redirected_to dispersione_url(@dispersione)
  end

  test "should destroy dispersione" do
    assert_difference('Dispersione.count', -1) do
      delete dispersione_url(@dispersione)
    end

    assert_redirected_to dispersiones_url
  end
end
