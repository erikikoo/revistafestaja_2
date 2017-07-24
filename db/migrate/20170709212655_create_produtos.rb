class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.text :descricao

      t.timestamps
    end
  end
end
