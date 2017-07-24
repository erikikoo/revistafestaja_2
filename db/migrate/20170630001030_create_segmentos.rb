class CreateSegmentos < ActiveRecord::Migration[5.0]
  def change
    create_table :segmentos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
