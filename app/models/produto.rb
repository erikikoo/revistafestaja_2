class Produto < ApplicationRecord
	
	has_many :venda_produtos, dependent: :destroy
	has_many :vendas, through: :venda_produtos	
	
	has_many :produto_valors, dependent: :destroy
	has_many :valors, through: :produto_valors

	accepts_nested_attributes_for :valors, allow_destroy: true, reject_if: :all_blank 
end
