class CreatePagos < ActiveRecord::Migration[5.0]
  def change
    create_table :pagos do |t|
      t.integer :prestamo_id
      t.float :pago_interes
      t.float :pago_monto_periodico
      t.date :pago_fecha
      t.float :pago_capital
      t.float :pago_prestamo_saldo
      t.integer :pago_periodo

      t.timestamps
    end
  end
end
