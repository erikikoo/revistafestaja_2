class AddReferenceFormaPagamentoToVenda < ActiveRecord::Migration[5.0]
  def change
    add_reference :vendas, :forma_pagamento, foreign_key: true
  end
end
