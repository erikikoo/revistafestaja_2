class CreateEnderecos < ActiveRecord::Migration[5.0]
  def change
    create_table :enderecos do |t|
      t.string :end
      t.string :numero, :limit => 4
      t.string :complemento
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
