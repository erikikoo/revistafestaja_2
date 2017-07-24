class ClienteSegmento < ApplicationRecord
  belongs_to :cliente
  belongs_to :segmento
end
