class SegmentosController < ApplicationController
  before_action :set_segmento, only: [:show, :edit, :update, :destroy]
  before_action :get_all_segmentos, only: [:index, :create, :update, :destroy]  

  layout 'admin'

  before_action :authenticate_user!
  
  # GET /segmentos
  # GET /segmentos.json
  def index
    
  end

  # GET /segmentos/1
  # GET /segmentos/1.json
  def show
  end

  # GET /segmentos/new
  def new
    @segmento = Segmento.new

  end

  # GET /segmentos/1/edit
  def edit
    @action = 'update'
    respond_to do |format|
      format.js { render :new}
    end
  end

  # POST /segmentos
  # POST /segmentos.json
  def create
    @segmento = Segmento.new(segmento_params)
    
    respond_to do |format|
      if @segmento.save
        @cliente = Cliente.new        
        if @action
          format.js {redirect_to segmentos_path, location: @cliente, notice: 'Segmento criado com sucesso!' }
        else
          format.js { render :index, notice: 'Opss! ocorreu um erro.' }
        end
        #format.html { redirect_to new_cliente_path, notice: 'Segmento was successfully created.' }        

      else
        format.js { render :new }
        
      end
    end
  end

  # PATCH/PUT /segmentos/1
  # PATCH/PUT /segmentos/1.json
  def update
    respond_to do |format|
      if @segmento.update(segmento_params) 
        @status = 'green'       
        format.js { redirect_to segmentos_path, notice: 'Segmento atualizado com secesso!' }        
      else
        @status = 'red'       
        format.js { render :new, notice: 'Opss! ocorreu um erro.' }
        
      end
    end
  end

  # DELETE /segmentos/1
  # DELETE /segmentos/1.json
  def destroy
    @segmento.destroy
    respond_to do |format|
      format.js { redirect_to segmentos_path, notice: 'Segmento deletado.' }
      
    end
  end


  def add_segmento_remoto
   @segmento = Segmento.new
   @action = true
    respond_to do |format|
      format.js { render :new}
    end
  end

  private
    def get_all_segmentos
      @segmento_count = Segmento.count
      @segmentos = Segmento.page(params[:page]).per(15)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_segmento
      @segmento = Segmento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def segmento_params
      params.require(:segmento).permit(:descricao)
    end
end
