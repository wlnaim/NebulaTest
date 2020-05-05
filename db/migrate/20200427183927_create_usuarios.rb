class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.text :email
      t.text :password

      t.timestamps
    end
  end
end
