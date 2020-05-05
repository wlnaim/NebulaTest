require 'test_helper'

class DispersionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dispersion = dispersions(:one)
  end

  test "should get index" do
    get dispersions_url
    assert_response :success
  end

  test "should get new" do
    get new_dispersion_url
    assert_response :success
  end

  test "should create dispersion" do
    assert_difference('Dispersion.count') do
      post dispersions_url, params: { dispersion: { cantidad: @dispersion.cantidad, fechaalta: @dispersion.fechaalta, prestamo_id: @dispersion.prestamo_id, usuario_id: @dispersion.usuario_id } }
    end

    assert_redirected_to dispersion_url(Dispersion.last)
  end

  test "should show dispersion" do
    get dispersion_url(@dispersion)
    assert_response :success
  end

  test "should get edit" do
    get edit_dispersion_url(@dispersion)
    assert_response :success
  end

  test "should update dispersion" do
    patch dispersion_url(@dispersion), params: { dispersion: { cantidad: @dispersion.cantidad, fechaalta: @dispersion.fechaalta, prestamo_id: @dispersion.prestamo_id, usuario_id: @dispersion.usuario_id } }
    assert_redirected_to dispersion_url(@dispersion)
  end

  test "should destroy dispersion" do
    assert_difference('Dispersion.count', -1) do
      delete dispersion_url(@dispersion)
    end

    assert_redirected_to dispersions_url
  end
end
