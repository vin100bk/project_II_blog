module ApplicationHelper
	def connected?
		!session[:current_member].nil?
	end

	# Views helpers
	def is_field_error(model, field_name)
		if !model.valid? && !model.errors.messages[field_name].nil?
			' field_error'
		end
	end
	
	def get_field_error_message(model, field_name)
		if !model.valid? && !model.errors.messages[field_name].nil?
			error_msg = '<div class="error_messages"><p>Errors appears in ' + field_name.to_s + ' :</p><ul>'
				model.errors.messages[field_name].each do |msg|
					error_msg += '<li>' + msg + '</li>'
				end
			error_msg += '</ul></div>'
			
			error_msg
		end
	end
end
