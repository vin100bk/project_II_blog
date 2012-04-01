require 'spec_helper'

describe PostsController do
  describe "GET 'index'" do
  
    before(:each) do
      @posts = [stub_model(Post, :title => "Title1", :body => "Body1"), stub_model(Post, :title => "Title2", :body => "Body2")]
    end
    
    it "assigns a list of posts" do
      Post.should_receive(:all).and_return(@posts)
      get 'index'
      assigns(:posts).should eq @posts
      response.should be_success
    end

    it "renders the template list" do
      get 'index'
      response.should render_template(:index)
    end
  end
end
