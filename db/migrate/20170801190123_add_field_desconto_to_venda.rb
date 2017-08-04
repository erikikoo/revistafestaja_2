class AddFieldDescontoToVenda < ActiveRecord::Migration[5.0]
  def change
    add_column :vendas, :desconto, :integer
  end
end
