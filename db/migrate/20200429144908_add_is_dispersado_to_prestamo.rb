class AddIsDispersadoToPrestamo < ActiveRecord::Migration[5.0]
  def change
    add_column :prestamos, :is_dipersado, :boolean
  end
end
