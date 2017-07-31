class AdministradorController < ApplicationController

	layout 'admin'

	before_action :authenticate_user!

	def index				
		#graficos
		@valor_vendas 		= Venda.group('extract( month from created_at)').sum('valor_total')
		@vendas 	  		= Venda.group('extract( month from created_at)').count

		query = Parcela.where('vencimento < ? AND status = ?', Time.new.yesterday, false)
		@parcelas_atrasadas = query.page params[:page]
		@parcelas_atrasadas_count = @parcelas_atrasadas.count
	end

	def segmento		
		@segmentos = Segmento.all		
		render 'segmentos/index'
		
	end

	def venda		
		@vendas = Venda.all
		#@location = 'adm'
		render 'vendas/index'
		
	end
end
