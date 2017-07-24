module ApplicationHelper

	def alert(action, text)
		if action.eql?('success')
  			raw("<div id='notice' class='alert alert-success' alert-dismissable>")
  			raw('<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>')
  			raw("#{text}")
  			raw("</div>")

		elsif action.eql?('danger')
  			raw("<p id='notice' class='alert alert-danger' alert-dismissable>#{text}</p>")
 		end 
	end

	def show_errors(object, field_name)
	  if object.errors.any?
	    if !object.errors.messages[field_name].blank?
	      object.errors.messages[field_name].join(", ")
	    end
	  end
	end 
end
