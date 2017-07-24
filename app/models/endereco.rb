class Endereco < ApplicationRecord
  belongs_to :cliente, optional: true

  
end
