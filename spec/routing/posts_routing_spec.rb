require 'spec_helper'

describe PostsController do 
  it "should routes to posts#index" do 
    get('/').should route_to("posts#index")
  end
  
  it "should routes to #index" do 
    get('/posts').should route_to("posts#index")
  end

  it "should provide the aliast post_path for /posts" do 
    posts_path.should == '/posts'
  end
end
