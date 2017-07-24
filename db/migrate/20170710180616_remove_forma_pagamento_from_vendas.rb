class RemoveFormaPagamentoFromVendas < ActiveRecord::Migration[5.0]
  def change
    remove_column :vendas, :forma_pagmento, :string
  end
end
