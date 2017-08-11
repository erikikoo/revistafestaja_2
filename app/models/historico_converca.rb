class HistoricoConverca < ApplicationRecord
  belongs_to :venda, optional: true
  belongs_to :user, optional: true

  validates :descricao, presence: true

end
