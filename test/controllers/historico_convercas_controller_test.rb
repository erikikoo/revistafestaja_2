require 'test_helper'

class HistoricoConvercasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historico_converca = historico_convercas(:one)
  end

  test "should get index" do
    get historico_convercas_url
    assert_response :success
  end

  test "should get new" do
    get new_historico_converca_url
    assert_response :success
  end

  test "should create historico_converca" do
    assert_difference('HistoricoConverca.count') do
      post historico_convercas_url, params: { historico_converca: { descricao: @historico_converca.descricao, user_id: @historico_converca.user_id, venda_id: @historico_converca.venda_id } }
    end

    assert_redirected_to historico_converca_url(HistoricoConverca.last)
  end

  test "should show historico_converca" do
    get historico_converca_url(@historico_converca)
    assert_response :success
  end

  test "should get edit" do
    get edit_historico_converca_url(@historico_converca)
    assert_response :success
  end

  test "should update historico_converca" do
    patch historico_converca_url(@historico_converca), params: { historico_converca: { descricao: @historico_converca.descricao, user_id: @historico_converca.user_id, venda_id: @historico_converca.venda_id } }
    assert_redirected_to historico_converca_url(@historico_converca)
  end

  test "should destroy historico_converca" do
    assert_difference('HistoricoConverca.count', -1) do
      delete historico_converca_url(@historico_converca)
    end

    assert_redirected_to historico_convercas_url
  end
end
