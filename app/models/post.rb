class Post < ActiveRecord::Base

	def created_at_formatted
		self[:created_at].strftime("%d/%m/%Y %H:%M")
	end
	
	def updated_at_formatted
		self[:updated_at].strftime("%d/%m/%Y %H:%M")
	end

end
