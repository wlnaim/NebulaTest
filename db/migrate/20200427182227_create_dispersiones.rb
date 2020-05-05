class CreateDispersiones < ActiveRecord::Migration[5.0]
  def change
    create_table :dispersiones do |t|
      t.integer :usuario_id
      t.integer :prestamo_id
      t.date :fechaalta
      t.float :cantidad

      t.timestamps
    end
  end
end
