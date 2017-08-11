class AddOrcamentoToVenda < ActiveRecord::Migration[5.0]
  def change
    add_column :vendas, :orcamento, :boolean, default: false
  end
end
