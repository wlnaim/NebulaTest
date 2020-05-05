class RemoveIsDispersadoFromPrestamo < ActiveRecord::Migration[5.0]
  def change
    remove_column :prestamos, :is_dipersado, :boolean
  end
end
