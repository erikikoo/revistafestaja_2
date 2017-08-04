class Desconto
	attr_reader :desc, :val

	def initialize(desc, val)
		@desc = desc
		@val  = val
	end

	def val_desc
		valor = @val * @desc/100
	end

	def valor_com_desconto
		valor_desconto = (@val - self.val_desc).to_f
	end

end