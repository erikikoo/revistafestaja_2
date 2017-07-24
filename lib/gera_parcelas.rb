class GeraParcelas

	def initialize(valor)
		@valor = valor.to_i
	end

	def gera_parcelas
		case @valor
			when 0..50
				par = '1'
				
			when 51..101
				par = '2'
				
			when 102..201
				par = '4'
			else 
				par = '4'	
				
		end
	end


end