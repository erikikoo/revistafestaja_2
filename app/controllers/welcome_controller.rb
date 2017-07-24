class WelcomeController < ApplicationController
  def index
  	@clientes = Cliente.where(publicar: true)
  	@q = Cliente.ransack(params[:q])
    #@layout_pesq = nil
  end

  def search
  	@q = Cliente.ransack(params[:q])
  	@clientes = @q.result()
  	
  	if @clientes.empty?
  		valor = params[:q][:razao_social_cont]
  		s = Segmento.find_by('descricao LIKE ?',"%#{valor}%")
  		s.nil? ? @clientes = nil : @clientes = s.clientes
      
  	end    
    @pesq = true
  end
end
