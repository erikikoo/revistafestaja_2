class RemoveNParcelasFromVendas < ActiveRecord::Migration[5.0]
  def change
  	remove_column :vendas, :n_parcelas, :string
  end
end
