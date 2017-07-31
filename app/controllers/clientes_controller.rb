class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy, :cliente_publicar, :cliente_despublicar]
  before_action :get_all_segmentos, only: [:index, :new, :show,:edit, :destroy]
  before_action :get_all, only: [:index, :destroy, :update,:cliente_publicar, :cliente_despublicar]
  
  layout 'admin'

  before_action :authenticate_user!

  # GET /clientes
  # GET /clientes.json
  def index
    
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    @action = 'show'
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    @cliente.contatos.build
    @cliente.enderecos.build
    
  end

  # GET /clientes/1/edit
  def edit
    @action = 'update'
    respond_to do |format|
      format.js { render :new, location: @action}
    end
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)
    
    
    respond_to do |format|
      if @cliente.save
        @action = 'success'        
        @cliente_segmento = @cliente.cliente_segmentos.new 
        format.html { redirect_to clientes_path, notice: 'Cliente criado com sucesso!' }
        #redirect_to({action: 'index'}, notice: 'Cliente criado com sucesso!')
      else
        @text = "Opss! ocorreu um erro!"
        @action = 'danger'
        format.js { render :new }
       
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
         format.html { redirect_to clientes_path, notice: 'Cliente atualizado com sucesso.' }
        
      else
        
        format.html { render :edit }
        
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    if @cliente.destroy
      respond_to do |format|
        @action = 'success'
        @text = 'Cliente excluido com sucesso!'
        format.js { redirect_to clientes_path, notice: 'Cliente Deletado.' }      
      end  
    else
      @text = 'Opss! ocorreu um erro' 
      @action = 'danger'
    end
  end

  def cliente_publicar
    @cliente.update_attributes(publicar: true)
    respond_to do |format|        
      format.js { render :index}
    end

  end  
  def cliente_despublicar
    @cliente.update_attributes(publicar: false)
    respond_to do |format|
      format.js { render :index}
    end
  end  

  private
      
    def get_all
      @clientes_count = Cliente.count
      @clientes = Cliente.order(:razao_social).page params[:page]
    end

    def get_all_segmentos
      @segmentos = Segmento.all
    end  

    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:responsavel, :razao_social, :segmento_ids=>[], :contatos_attributes => [:id, :numero, :_destroy, :whatsapp], :enderecos_attributes => [:id, :end, :numero, :complemento])
    end
end
