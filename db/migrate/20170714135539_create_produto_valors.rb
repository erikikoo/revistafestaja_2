class CreateProdutoValors < ActiveRecord::Migration[5.0]
  def change
    create_table :produto_valors do |t|
      t.references :produto, foreign_key: true
      t.references :valor, foreign_key: true
      t.date :mes

      t.timestamps
    end
  end
end
