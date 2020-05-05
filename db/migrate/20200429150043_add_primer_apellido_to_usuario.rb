class AddPrimerApellidoToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :primer_apellido, :text
  end
end
