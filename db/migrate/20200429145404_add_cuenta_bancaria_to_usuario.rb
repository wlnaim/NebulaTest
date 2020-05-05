class AddCuentaBancariaToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :cuenta_bancaria, :text
    add_column :usuarios, :primer_nombre, :text
    add_column :usuarios, :primer_apelido, :text
  end
end
