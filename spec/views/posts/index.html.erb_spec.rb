require 'spec_helper'

describe "posts/index.html.erb" do
	it "displays all the posts" do
		assign(:posts, [
			stub_model(Post, :title => "subject 1", :body => "content 1", :author => "vin100", :created_at => Time.new(2012,4,1,13,30,0,"+00:00"), :updated_at => Time.new(2012,4,1,17,21,0,"+00:00")),
			stub_model(Post, :title => "subject 2", :body => "content 2", :author => "Pedro", :created_at => Time.new(2012,3,25,11,02,0,"+00:00"), :updated_at => Time.new(2012,3,25,11,02,0,"+00:00"))
		])
		render
		
		rendered.should =~ /<h2>subject 1<\/h2>/
		rendered.should =~ /<p class="post_infos">\s*<span class="right">Last modification : 01\/04\/2012 17:21<\/span>\s*Created by <strong>vin100<\/strong> at 01\/04\/2012 13:30\s*<\/p>/
		rendered.should =~ /<div class="post_content">content 1<\/div>/
		
		rendered.should =~ /<h2>subject 2<\/h2>/
		rendered.should =~ /<p class="post_infos">\s*Created by <strong>Pedro<\/strong> at 25\/03\/2012 11:02\s*<\/p>/
		rendered.should =~ /<div class="post_content">content 2<\/div>/
	end
end
