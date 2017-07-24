class AddRazaoSocialToCliente < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :razao_social, :string
  end
end
