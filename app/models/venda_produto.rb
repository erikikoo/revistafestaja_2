class VendaProduto < ApplicationRecord
  belongs_to :venda
  belongs_to :produto
end
