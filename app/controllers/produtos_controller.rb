class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  before_action :authenticate_user!
  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.all
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
    @action = 'show'
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
    @produto.valors.build
  end

  # GET /produtos/1/edit
  def edit
    @action = 'update'
    respond_to do |format|
      format.js { render :new}
    end
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to produtos_path, notice: 'Produto criado com sucesso' }        
      else
        format.js { render :new }        
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to produtos_path, notice: 'Produto atualizado com sucesso!' }
        
      else
        format.js { render :new }        
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto excluido' }      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:descricao, :valors_attributes => [:preco])
    end
end
