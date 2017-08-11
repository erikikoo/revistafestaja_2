class AddFaturarToVenda < ActiveRecord::Migration[5.0]
  def change
    add_column :vendas, :faturar, :boolean, default: false
  end
end
