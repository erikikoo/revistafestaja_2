Rails.application.routes.draw do
  scope '/administrador' do
    resources :parcelas
    resources :valors
    resources :forma_pagamentos
    resources :produtos
    resources :enderecos
    resources :contatos
    resources :clientes
    resources :segmentos
    resources :vendas
  end

  devise_for :users, path: 'autenticar', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secreto', confirmation: 'verificacao', unlock: 'desbloquear', registration: 'registrar', sign_up: 'cadastrar' }

  get 'welcome/index'               => 'welcome#index'
  get '/'                           => 'welcome#index'
  post '/search'                    => 'welcome#search'
  
  
  get 'cliente-publicar/:id'        => 'clientes#cliente_publicar'
  get 'cliente-despublicar/:id'     => 'clientes#cliente_despublicar'
  get 'clientes'                    => 'clientes#index'
  
  get '/add_segmento_remote'        => 'segmentos#add_segmento_remoto'
  
  get 'admin'                       => 'administrador#index'
  get 'administrador'               => 'administrador#index'
  get 'admin/segmentos'             => 'administrador#segmento'
  get 'admin/vendas'                => 'administrador#venda'
  
  post '/venda-search'              => 'vendas#search'
  get '/venda/show/:id'             => 'vendas#show'
  get '/vendas/:id/cliente'         => 'vendas#new'
  
  get '/reloadParcelas'             =>'vendas#gera_parcelas'
  get '/reloadTotal'                =>'vendas#get_valor'

  put '/baixar-parcela/:id'          =>'parcelas#baixar_parcela'
  put '/reabrir-parcela/:id'         =>'parcelas#reabrir_parcela'
  
  
end
