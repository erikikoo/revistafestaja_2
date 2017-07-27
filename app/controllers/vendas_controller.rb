class VendasController < ApplicationController
  before_action :set_venda, only: [:show, :edit, :update, :destroy ]
  before_action :get_cliente, only: [:new]
  before_action :get_vendas , only: [:create, :destroy, :update, :index]
  before_action :gera_codigo, only: [:new, :create, :update]
  
  layout 'admin'

  before_action :authenticate_user!
  
  require "#{Rails.root}/lib/gera_codigo_venda.rb"
  require "#{Rails.root}/lib/mes.rb"

  # GET /vendas
  # GET /vendas.json
  def index
    @vendas_count = Venda.count
    @vendas = Venda.order(:codigo).page params[:page]
    @q = Venda.ransack(params[:q])
    @vendas = @q.result.page(params[:page])         
  end

  # GET /vendas/1
  # GET /vendas/1.json
  def show
    @action = 'show'
    @parcelas = Parcela.new
  end

  # GET /vendas/new
  def new    
    @venda                 = Venda.new            
    @venda.parcelas.build

    @meses                 = Mes.new.meses    
    @mes                   = @meses[Time.new.month-1]
    
    #@venda.n_parcelas      = 1 
    @venda.codigo          = @new_cod
    @venda.cliente_id      = @cliente.id    
  end

  # GET /vendas/1/edit
  def edit
    @action = 'update'
    respond_to do |format|
      format.js { render :new, location: @action}
    end
  end

  # POST /vendas
  # POST /vendas.json
  def create
    @venda = Venda.new(venda_params)
    @venda.user_id = current_user.id    
    #@venda.forma_pagamento_id = 1 if @venda.valor_total < 50
    if @venda.forma_pagamento_id.eql?(1)
      parcelas = @venda.parcelas.new
      parcelas.valor = @venda.valor_total
      ven = Time.new + 7.days
      parcelas.vencimento = ven
    end    
    @venda.codigo = @new_cod
    respond_to do |format|
      if @venda.save!             
        format.js { redirect_to clientes_path, notice: 'Venda criada com sucesso!' }
        
      else
        @venda.cod = @new_cod
        format.html { render :new }
        
      end
    end
  end

  # PATCH/PUT /vendas/1
  # PATCH/PUT /vendas/1.json
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

  # DELETE /vendas/1
  # DELETE /vendas/1.json
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
      @new_cod               = GeraCodigoVenda.new(last_cod).gera_codigo

    end

    def get_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_venda
      @venda = Venda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venda_params
      params.require(:venda).permit(:user_id, :cliente_id,  :forma_pagamento_id, :edicao, :valor_total, :codigo, :produto_ids, parcelas_attributes: [:_destroy,:venda_id, :valor, :vencimento, :status])
    end
end
