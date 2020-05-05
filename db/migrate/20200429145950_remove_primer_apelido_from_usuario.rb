class RemovePrimerApelidoFromUsuario < ActiveRecord::Migration[5.0]
  def change
    remove_column :usuarios, :primer_apelido, :text
  end
end
