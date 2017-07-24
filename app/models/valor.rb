class Valor < ApplicationRecord
	has_many :produto_valors, dependent: :destroy
	has_many :produtos, through: :produto_valors
end
