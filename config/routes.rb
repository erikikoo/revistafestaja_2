Rails.application.routes.draw do
  resources :parcelas
  resources :valors
  resources :forma_pagamentos
  resources :produtos
  devise_for :users, path: 'autenticar', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secreto', confirmation: 'verificacao', unlock: 'desbloquear', registration: 'registrar', sign_up: 'cadastrar' }
  resources :enderecos
  resources :contatos
  resources :clientes
  resources :segmentos
  resources :vendas

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
