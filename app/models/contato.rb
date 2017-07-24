class Contato < ApplicationRecord
  belongs_to :cliente, optional: true

  validates :numero, presence: true
end
