class AddBannerToClientes < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :banner, :string
  end
end
