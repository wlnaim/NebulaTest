class CreatePrestamos < ActiveRecord::Migration[5.0]
  def change
    create_table :prestamos do |t|
      t.integer :usuario_id
      t.integer :plazo_prestamo
      t.float :interes_prestamo
      t.float :monto_prestamo
      t.float :monto_cubrir_prestamo
      t.float :pago_periodico_prestamo

      t.timestamps
    end
  end
end
