class CreateParcelas < ActiveRecord::Migration[5.0]
  def change
    create_table :parcelas do |t|
      t.references :venda, foreign_key: true
      t.float :valor
      t.date :vencimento
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
