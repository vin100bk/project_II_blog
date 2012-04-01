require 'spec_helper'

describe "ListingPosts" do
  describe "GET /posts" do
    before(:each) do
      @post1 = Post.create(:title => "sujet1", :body => "bla bla", :author => "vin100")
      @post2 = Post.create(:title => "sujet2", :body => "bla bla. Blu blu blu", :author => "Pedro")
    end
    
    describe "GET /posts" do
      it "generates a listing of posts" do
        visit posts_path
        page.should have_content @post1.title
        page.should have_content @post1.body
        page.should have_content @post1.author
        page.should have_content @post1.created_at_formatted
        page.should have_content @post2.title
        page.should have_content @post2.body
        page.should have_content @post2.author
        page.should have_content @post2.created_at_formatted
      end
    end
  end
end
