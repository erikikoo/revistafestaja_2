class Parcela < ApplicationRecord
  belongs_to :venda, optional: true

  
end
