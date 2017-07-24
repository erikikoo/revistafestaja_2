module WelcomeHelper

	def listar_Cliente(s)
		 raw('<h3>'+s.nome+'</h3>')
								
		raw('<h6><strong>Segmento</strong></h6>')
		s.segmentos.each do |s|
			raw'<i class="glyphicon glyphicon-ok"></i>'+s.descricao+ '<br />'
		end
		raw('<hr />')				
		raw('<h6><strong>Contato</strong></h6>')
		s.contatos.each do |c|
			if c.whatsapp
				raw('<i class="fa fa-whatsapp fa-5x" aria-hidden="true"></i>')
				c.numero 
				raw('<br />')
			end
			if c.whatsapp != true
				raw('<i class="fa fa-phone" aria-hidden="true"></i>')
				c.numero 
				raw('<br />')
			end
									
		end
		raw('<hr />')
		raw('<h6><strong>Endereço</strong></h6>')				
		s.enderecos.each do |e|								
			e.end 
			raw('-') 
			e.numero 
			unless e.complemento.blank?
				e.complemento
				raw('-')
			end							
		end

	end

end
