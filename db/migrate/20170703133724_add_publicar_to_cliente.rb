class AddPublicarToCliente < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :publicar, :boolean, default: false
  end
end
