class CreateVendas < ActiveRecord::Migration[5.0]
  def change
    create_table :vendas do |t|
      t.references :user, foreign_key: true
      t.references :cliente, foreign_key: true      
      t.string :edicao
      t.float :valor_total
      t.integer :n_parcelas
      t.string :cod, :limit => 11
      t.string :forma_pagmento

      t.timestamps
    end
  end
end
