module AdministradorHelper

	require "#{Rails.root}/lib/mes.rb"

	def converte_mes(m)
		mes = Mes.new(m).get_mes_extensio.to_s
	end

end
