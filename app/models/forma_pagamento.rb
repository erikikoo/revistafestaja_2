class FormaPagamento < ApplicationRecord
	has_many :vendas

	validates :descricao, presence: true
end
