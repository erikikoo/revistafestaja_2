class RenameNomeToResponsavelInClienteTable < ActiveRecord::Migration[5.0]
  def change
  	rename_column :clientes, :nome, :responsavel

  end
end
