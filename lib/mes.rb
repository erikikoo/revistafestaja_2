class Mes

	def initialize(m=0)
		@m = m
	end

	def get_mes_extensio
		mes = self.meses[@m-1]
	end

	def meses
		@meses = %w(Janeiro Fevereiro Março Abril Maio junho Julho Agosto Setembro Outubro Novembro Dezembro)
	end

end