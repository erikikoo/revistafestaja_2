class CreateValors < ActiveRecord::Migration[5.0]
  def change
    create_table :valors do |t|
      t.float :preco

      t.timestamps
    end
  end
end
