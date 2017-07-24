class AdministradorController < ApplicationController

	layout 'admin'

	before_action :authenticate_user!

	def index		
		#@clientes = Cliente.all
		#@location = 'adm'
		#render 'clientes/index'
		
	end

	def segmento		
		@segmentos = Segmento.all
		#@location = 'adm'
		render 'segmentos/index'
		
	end

	def venda		
		@vendas = Venda.all
		#@location = 'adm'
		render 'vendas/index'
		
	end
end
