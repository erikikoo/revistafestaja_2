module VendasHelper

	require "#{Rails.root}/lib/desconto.rb"

	def desconto(des,val)
		des = Desconto.new(des,val).valor_com_desconto.to_f
	end
end
