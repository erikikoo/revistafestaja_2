class CreateHistoricoConvercas < ActiveRecord::Migration[5.0]
  def change
    create_table :historico_convercas do |t|
      t.references :venda, foreign_key: true
      t.references :user, foreign_key: true
      t.text :descricao

      t.timestamps
    end
  end
end
