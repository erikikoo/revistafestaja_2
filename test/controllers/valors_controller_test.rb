require 'test_helper'

class ValorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valor = valors(:one)
  end

  test "should get index" do
    get valors_url
    assert_response :success
  end

  test "should get new" do
    get new_valor_url
    assert_response :success
  end

  test "should create valor" do
    assert_difference('Valor.count') do
      post valors_url, params: { valor: { preco: @valor.preco } }
    end

    assert_redirected_to valor_url(Valor.last)
  end

  test "should show valor" do
    get valor_url(@valor)
    assert_response :success
  end

  test "should get edit" do
    get edit_valor_url(@valor)
    assert_response :success
  end

  test "should update valor" do
    patch valor_url(@valor), params: { valor: { preco: @valor.preco } }
    assert_redirected_to valor_url(@valor)
  end

  test "should destroy valor" do
    assert_difference('Valor.count', -1) do
      delete valor_url(@valor)
    end

    assert_redirected_to valors_url
  end
end
