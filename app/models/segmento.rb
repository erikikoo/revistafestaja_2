class Segmento < ApplicationRecord
	has_many :cliente_segmentos, dependent: :destroy
	
	has_many :clientes, through: :cliente_segmentos	

	validates :descricao, presence: true
end
