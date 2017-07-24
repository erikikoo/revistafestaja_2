class Cliente < ApplicationRecord
	has_many :cliente_segmentos, dependent: :destroy
	has_many :contatos, dependent: :destroy
	has_many :enderecos, dependent: :destroy
	

	has_many :segmentos, through: :cliente_segmentos
	
	has_many :vendas
	
	validates :responsavel,:razao_social, :contatos, presence: true
	validates :razao_social ,uniqueness: true	

	accepts_nested_attributes_for :contatos, allow_destroy: true
	accepts_nested_attributes_for :enderecos, allow_destroy: true

	paginates_per 10

end
