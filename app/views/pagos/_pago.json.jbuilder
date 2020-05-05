json.extract! pago, :id, :prestamo_id, :pago_interes, :pago_monto_periodico, :pago_fecha, :pago_capital, :pago_prestamo_saldo, :pago_periodo, :created_at, :updated_at
json.url pago_url(pago, format: :json)
