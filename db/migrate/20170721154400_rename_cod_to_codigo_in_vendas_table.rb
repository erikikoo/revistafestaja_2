class RenameCodToCodigoInVendasTable < ActiveRecord::Migration[5.0]
  def change
  	rename_column :vendas, :cod, :codigo
  end
end
