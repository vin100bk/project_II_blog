class PostsController < ApplicationController
	include ApplicationHelper
	
	def index
		@posts = Post.all
	end
	
	def new
		if connected?
			@new_form = true
			@post = Post.new
		else
			not_connected
		end
	end
	
	def create
		if connected?
			@post = Post.new(params['post'])
			@post.author = session[:current_member]
		
			if @post.save
				# Success
				flash[:notice] = 'Post successfully added'
				redirect_to root_path
			else
				# Failure
				flash[:error] = 'Error while post registring'
				render 'new'
			end
		else
			not_connected
		end
	end
	
	def not_connected
		flash[:error] = 'You should be registered to add a post. <a href="' + new_session_path + '">Login</a>.'
		redirect_to root_path
	end
end
