class VendasController < ApplicationController
  before_action :set_venda, only: [:show, :edit, :update, :destroy ]
  before_action :get_cliente, only: [:new]
  before_action :get_vendas , only: [:create, :destroy, :update, :index]
  before_action :gera_codigo, only: [:new, :create, :update]
  
  layout 'admin'

  before_action :authenticate_user!
  
  require "#{Rails.root}/lib/gera_codigo_venda.rb"
  require "#{Rails.root}/lib/mes.rb"
  require "#{Rails.root}/lib/desconto.rb"
  
  
  def index
    @vendas_count = Venda.count
    @vendas = Venda.order(:codigo).page params[:page]
    @q = Venda.ransack(params[:q])
    @vendas = @q.result.page(params[:page])         
  end

  
  def show
    @action = 'show'
    @parcelas = Parcela.new
  end

  
  def new    
    @venda                 = Venda.new            
    
    $_historico = Venda.where(cliente_id: params[:id], orcamento: true)
    
    
    @historico = $_historico.last
    @historicos = $_historico.last
    
    @historico_converca = HistoricoConverca.new
    #Venda.where(cliente_id: 7, orcamento: true)
    unless @historico.nil?
      
      @venda = @historico
                  
      @venda.codigo = @historico.codigo
      
      @venda_id = @historico.id
      
      $_desconto = Desconto.new(@historico.desconto.to_i, @historico.valor_total.to_i)
      @desconto = $_desconto.valor_com_desconto.to_s
      @valor = $_desconto.get_valor_total.to_s      
      
    else
      @meses                 = Mes.new.meses    
      @mes                   = @meses[Time.new.month-1]      
      @venda.codigo          = @new_cod.gera_codigo
    end
    @venda.cliente_id      = @cliente.id    
    
    @venda.parcelas.build
    @venda.historico_convercas.build
  end

  
  def edit
    @action = 'update'
    @historico_converca = HistoricoConverca.new
    respond_to do |format|
      format.js { render :new, location: @action}
    end
  end

  
  def create
    @venda = Venda.new(venda_params)
    
    @venda.user_id = current_user.id    
    @venda.desconto.blank? ? @venda.desconto = 0 : @venda.desconto
    #teste = @venda.historico_convercas.user_id
    #teste = current_user.id
    #historico = @venda.historico_convercas.new
    #historico.venda_id = @new_cod
    
    if @venda.forma_pagamento_id.eql?(1)
      parcelas = @venda.parcelas.new
      parcelas.valor = @venda.valor_total
      ven = Time.new + 7.days
      parcelas.vencimento = ven
    end    

    @venda.codigo = @new_cod.gera_codigo
    
    respond_to do |format|
      if @venda.save!             
        historico = HistoricoConverca.last
        historico.update_attributes(user_id: current_user.id)
        format.js { redirect_to clientes_path, notice: 'Venda criada com sucesso!' }
        
      else
        @venda.cod = @new_cod.gera_codigo
        format.html { render :new }
        
      end
    end
  end

  
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        @action = 'success'          
        format.html { redirect_to vendas_path, notice: 'Venda atualizada com sucesso!' }
        
      else
        format.js { render :new }
        
      end
    end
  end

  
  def destroy
    @venda.destroy
      respond_to do |format|        
        format.html { redirect_to vendas_path, notice: 'Venda excluida' }        
    end
  end

  
  def gera_parcelas    
    @venda = Venda.new
    respond_to do |format|
      format.js {render :parcelas, f: @venda}
    end
  end

  def get_valor      
     valor = Produto.find(params[:id]) 
     @desconto = Desconto.new(params[:desc].to_i, valor.valors.last.preco.to_i).valor_com_desconto    
     
     @valor = total_valor(valor.valors.last.preco)
     respond_to do |format|
      format.js { render :valor_total}
    end

  end

  def search     
    @q = Venda.ransack(params[:q])
    @vendas = @q.result.page(params[:page]) 
    @par = params[:q][:codigo_cont]   
  end
  
  private  

    def total_valor(val)
      valor = 0 if valor.nil?
      valor += val
    end

    def get_vendas
      @vendas = Venda.all
    end

    def gera_codigo
      last_cod               = Venda.select("codigo").last
      @new_cod               = GeraCodigoVenda.new(last_cod)

    end

    def get_cliente
      @cliente = Cliente.find(params[:id])
    end

    
    def set_venda
      @venda = Venda.includes(:parcelas, :produtos).find(params[:id])
    end

    
    def venda_params
      params.require(:venda).permit(:user_id, :cliente_id,  :forma_pagamento_id, :orcamento,:edicao, :valor_total, :desconto, :codigo, :id, :produto_ids, parcelas_attributes: [:_destroy,:venda_id, :valor, :vencimento, :status], historico_convercas_attributes: [:_destroy, :venda_id, :user_id, :descricao])
    end
end
