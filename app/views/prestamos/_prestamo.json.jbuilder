json.extract! prestamo, :id, :usuario_id, :plazo_prestamo, :interes_prestamo, :monto_prestamo, :monto_cubrir_prestamo, :pago_periodico_prestamo, :created_at, :updated_at
json.url prestamo_url(prestamo, format: :json)
