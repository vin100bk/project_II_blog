module ApplicationHelper
	def connected?
		!session[:current_member].nil?
	end

	# Views helpers
	def is_field_error(new_form, model, field_name)
		if new_form.nil? && model != nil && !model.valid? && !model.errors.messages[field_name].nil?
			' field_error'
		end
	end
	
	def get_field_error_message(new_form, model, field_name)
		error_msg = ''
		if new_form.nil? && !model.valid? && !model.errors.messages[field_name].nil?
			error_msg = '<div class="error_messages"><p>Errors appears in ' + field_name.to_s + ' :</p><ul>'
				model.errors.messages[field_name].each do |msg|
					error_msg += '<li>' + msg + '</li>'
				end
			error_msg += '</ul></div>'
		end
		
		error_msg
	end
end
