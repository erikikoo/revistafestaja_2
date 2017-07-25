class GeraCodigoVenda

	def initialize(last_cod)
		if last_cod.nil?			
			@last_cod = 0
		else	
			@last_cod = last_cod
		end	
	end

	def gera_codigo
		if @last_cod.codigo.empty? 
			last_cod = @last_cod.codigo.to_s[-4..-1].to_i 
    	end
    	
    	 last_cod += 1
    	 num = completa_zeros(last_cod,4)
	     ano = get_year	     
	     mes = completa_zeros(get_month.to_i,2)
	     codigo = ano+mes+num
    	 codigo.to_i    	
	end
	
	private
		def completa_zeros(cod, qnt_zero)
			if qnt_zero > 2
				return val = cod.to_s.rjust(qnt_zero,'0')
			end	
			
			val = cod < 10 ? cod.to_s.rjust(qnt_zero,'0') : cod.to_s
		end

		def get_month
			mes = Time.new.month.to_s
		end

		def get_year
			ano = Time.new.year.to_s
		end
	
end