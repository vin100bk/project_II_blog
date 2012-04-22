require 'spec_helper'

describe PostsController do
	describe "GET 'index'" do
		before do
			@posts = [stub_model(Post, :title => "Title1", :body => "Body1"), stub_model(Post, :title => "Title2", :body => "Body2")]
		end

		it "should assigns a list of posts" do
			Post.should_receive(:all).and_return(@posts)
			get 'index'
			assigns(:posts).should eq @posts
			response.should be_success
		end

		it "should renders the template list" do
			get 'index'
			response.should render_template(:index)
		end
	end
	
	describe "GET 'new'" do
		context "Connected" do
			before do
				session[:current_member] = 'My_author'
			end
		
			it "should renders the post adding form" do
				get 'new'
				response.should render_template(:new)
			end
		end
		
		context "Not connected" do
			it "should renders the post adding form" do
				get 'new'
				response.should redirect_to root_path
			end
		end
	end
	
	describe "POST 'create'" do
		before do
			@params = {'title' => "My_title", 'body' => "My_body"}
		end
		
		context "Connected" do
			before do
				session[:current_member] = 'My_author'
				@post = stub_model(Post, @params)
			end
	
			it "Should redirect and display a notice with a valid registration" do
				Post.should_receive(:new).with(@params).and_return(@post)
				post 'create', {'post' => @params}
				flash[:notice].should == 'Post successfully added'
				response.should redirect_to root_path
			end
		end
		
		context "Not connected" do
			it "Should redirect and display an error" do
				post 'create', {'post' => @params}
				flash[:error].should == 'You should be registered to add a post.'
				response.should redirect_to root_path
			end
		end
	end
end
