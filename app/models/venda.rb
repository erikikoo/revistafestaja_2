class Venda < ApplicationRecord
  belongs_to :user
  belongs_to :cliente  
  belongs_to :forma_pagamento

  has_many :venda_produtos, dependent: :destroy
  has_many :produtos, through: :venda_produtos
  
  has_many :parcelas, dependent: :destroy
  accepts_nested_attributes_for :parcelas, allow_destroy: true, reject_if: :all_blank  
  
  has_many :historico_convercas, dependent: :destroy
  accepts_nested_attributes_for :historico_convercas, allow_destroy: true, reject_if: :all_blank  
  
  validates :valor_total, presence: true


  paginates_per 10
end
