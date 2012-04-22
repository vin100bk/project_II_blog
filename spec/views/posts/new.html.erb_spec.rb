require 'spec_helper'

describe "posts/new.html.erb" do
	it "should display the html form post adding" do
		assign(:post, Post.new)
		render
		
		view.should render_template(:partial => "_form")
		
		rendered.should =~ /<h2>Add a post<\/h2>/
		rendered.should =~ /method="post"/
		rendered.should =~ /action="\/posts"/
		
		rendered.should =~ /<label for="post_title">Title<\/label>/
		rendered.should =~ /<input id="post_title" name="post\[title\]" size="[0-9]+" type="text" \/>/
		
		rendered.should =~ /<label for="post_body">Body<\/label>/
		rendered.should =~ /<textarea cols="[0-9]+" id="post_body" name="post\[body\]" rows="[0-9]+"><\/textarea>/
		
		rendered.should =~ /<input name="commit" type="submit" value="Save" \/>/
	end
end
