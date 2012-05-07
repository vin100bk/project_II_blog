class SessionController < ApplicationController
	def new
		#if !session[:current_member].nil? || (!params['token'].nil? && !params['login'].nil? && params['token'] == Digest::SHA1.hexdigest('e1f759d08f2b029f43d3347e15212aee0bd87f68' + params['login']))
			# User connected
		 #	session[:current_member] ||= params['login']
			# Here is your protected section, put your private code
		#	redirect_to root_path
		#elsif !params['token'].nil? && !params['login'].nil?
			# Access refused
		#	flash[:error] = 'Access refused ! Error while logging, your identification informations are not valid !'
		#	redirect_to root_path
		#else
		#	redirect_to 'http://localhost:9090/My_blog/sessions/new?origin=' + request.path
		#end
		
		session[:current_member] = 'test'
		redirect_to root_path
	end
	
	def destroy
		session[:current_member] = nil
		redirect_to root_path
	end
end
