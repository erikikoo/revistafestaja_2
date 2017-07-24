require 'test_helper'

class ParcelasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parcela = parcelas(:one)
  end

  test "should get index" do
    get parcelas_url
    assert_response :success
  end

  test "should get new" do
    get new_parcela_url
    assert_response :success
  end

  test "should create parcela" do
    assert_difference('Parcela.count') do
      post parcelas_url, params: { parcela: { status: @parcela.status, valor: @parcela.valor, vencimento: @parcela.vencimento, venda_id: @parcela.venda_id } }
    end

    assert_redirected_to parcela_url(Parcela.last)
  end

  test "should show parcela" do
    get parcela_url(@parcela)
    assert_response :success
  end

  test "should get edit" do
    get edit_parcela_url(@parcela)
    assert_response :success
  end

  test "should update parcela" do
    patch parcela_url(@parcela), params: { parcela: { status: @parcela.status, valor: @parcela.valor, vencimento: @parcela.vencimento, venda_id: @parcela.venda_id } }
    assert_redirected_to parcela_url(@parcela)
  end

  test "should destroy parcela" do
    assert_difference('Parcela.count', -1) do
      delete parcela_url(@parcela)
    end

    assert_redirected_to parcelas_url
  end
end
