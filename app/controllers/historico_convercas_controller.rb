class HistoricoConvercasController < ApplicationController
  before_action :set_historico_converca, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_user!
  
  require "#{Rails.root}/lib/gera_codigo_venda.rb"

  # GET /historico_convercas
  # GET /historico_convercas.json
  def index
    @historico_convercas = HistoricoConverca.all
  end

  # GET /historico_convercas/1
  # GET /historico_convercas/1.json
  def show
  end

  # GET /historico_convercas/new
  def new
    @historico_converca = HistoricoConverca.new
  end

  # GET /historico_convercas/1/edit
  def edit
  end

  # POST /historico_convercas
  # POST /historico_convercas.json
  def create
    @historico_converca = HistoricoConverca.new(historico_converca_params)   

    @historico_converca.user_id = current_user.id
    respond_to do |format|
      if @historico_converca.save
        @historico_converca = HistoricoConverca.new
        @historicos = Venda.where(cliente_id: params[:id], orcamento: true)
        format.js { render :create, notice: 'Venda atualiza!', location: @historicos }
      else
        format.html { render 'vendas/new' }        
      end
    end
  end

  # PATCH/PUT /historico_convercas/1
  # PATCH/PUT /historico_convercas/1.json
  def update
    respond_to do |format|
      if @historico_converca.update(historico_converca_params)
        format.html { redirect_to @historico_converca, notice: 'Historico converca was successfully updated.' }
        format.json { render :show, status: :ok, location: @historico_converca }
      else
        format.html { render :edit }
        format.json { render json: @historico_converca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historico_convercas/1
  # DELETE /historico_convercas/1.json
  def destroy
    @historico_converca.destroy
    respond_to do |format|
      format.html { redirect_to historico_convercas_url, notice: 'Historico converca was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def reload
  #   @historicos = Venda.where(cliente_id: params[:id], orcamento: true)
  #   respond_to do |format|
  #     format.js { render :reload }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historico_converca
      @historico_converca = HistoricoConverca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historico_converca_params
      params.require(:historico_converca).permit(:venda_id, :user_id, :descricao)
    end
end
