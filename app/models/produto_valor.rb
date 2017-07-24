class ProdutoValor < ApplicationRecord
  belongs_to :produto
  belongs_to :valor
end
