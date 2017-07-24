class ParcelasController < ApplicationController
  before_action :set_parcela, only: [:show, :edit, :update, :destroy]

  # GET /parcelas
  # GET /parcelas.json
  def index
    @parcelas = Parcela.all
  end

  # GET /parcelas/1
  # GET /parcelas/1.json
  def show
  end

  # GET /parcelas/new
  def new
    @parcela = Parcela.new
  end

  # GET /parcelas/1/edit
  def edit
  end

  # POST /parcelas
  # POST /parcelas.json
  def create
    @parcela = Parcela.new(parcela_params)

    respond_to do |format|
      if @parcela.save
        format.html { redirect_to @parcela, notice: 'Parcela was successfully created.' }
        format.json { render :show, status: :created, location: @parcela }
      else
        format.html { render :new }
        format.json { render json: @parcela.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parcelas/1
  # PATCH/PUT /parcelas/1.json
  def update
    respond_to do |format|
      if @parcela.update(parcela_params)
        format.html { redirect_to @parcela, notice: 'Parcela was successfully updated.' }
        format.json { render :show, status: :ok, location: @parcela }
      else
        format.html { render :edit }
        format.json { render json: @parcela.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parcelas/1
  # DELETE /parcelas/1.json
  def destroy
    @parcela.destroy
    respond_to do |format|
      format.html { redirect_to parcelas_url, notice: 'Parcela was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parcela
      @parcela = Parcela.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parcela_params
      params.require(:parcela).permit(:venda_id, :valor, :vencimento, :status)
    end
end
