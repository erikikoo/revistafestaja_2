class WelcomeController < ApplicationController
  def index
  	@clientes = Cliente.where(publicar: true)
  	@q = Cliente.ransack(params[:q])
    #@layout_pesq = nil
  end

  def search
    query = Cliente.where(publicar: true)
  	@q = query.ransack(params[:q])
  	@clientes = @q.result()
  	
  	if @clientes.empty?
  		valor = params[:q][:razao_social_cont]
  		s = Segmento.find_by('descricao ILIKE ?',"%#{valor}%")
  		s.nil? ? @clientes = '' : @clientes = s.clientes.where(publicar: true)
      #Segmento.find_by('descricao LIKE ?',"%#{BOLO}%")
  	end    
    @pesq = true
  end
end

