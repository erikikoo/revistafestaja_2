class CreateClienteSegmentos < ActiveRecord::Migration[5.0]
  def change
    create_table :cliente_segmentos do |t|
      t.references :cliente, foreign_key: true
      t.references :segmento, foreign_key: true

      t.timestamps
    end
  end
end
