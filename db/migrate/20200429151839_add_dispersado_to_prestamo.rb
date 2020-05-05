class AddDispersadoToPrestamo < ActiveRecord::Migration[5.0]
  def change
    add_column :prestamos, :is_dispersado, :boolean
  end
end
