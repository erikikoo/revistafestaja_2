class CreateVendaProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :venda_produtos do |t|
      t.references :venda, foreign_key: true
      t.references :produto, foreign_key: true
      t.integer :valor

      t.timestamps
    end
  end
end
