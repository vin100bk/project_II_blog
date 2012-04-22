require 'spec_helper'

describe Post do

	subject do
		Post.new(:title => "sujet 1", :body => "contenu 1", :author => "vin100", :created_at => Time.new(2012,4,1,13,30,0,"+00:00"), :updated_at => Time.new(2012,8,1,16,59,0,"+00:00"))
	end

	describe "Post registration" do
		it "Should register the post with success" do
			subject.should be_valid
		end
		
		it "Should not register without title" do
			subject.title = nil
			subject.should_not be_valid
			subject.title = ""
			subject.should_not be_valid
		end
		
		it "Should not register without body" do
			subject.body = nil
			subject.should_not be_valid
			subject.body = ""
			subject.should_not be_valid
		end
		
		it "Should not register without author" do
			subject.author = nil
			subject.should_not be_valid
			subject.author = ""
			subject.should_not be_valid
		end
	end

	describe "Time functions" do
		it "Post::created_at_formatted()" do
			subject.created_at_formatted.should == '01/04/2012 13:30'
		end
		
		it "Post::updated_at_formatted()" do
			subject.updated_at_formatted.should == '01/08/2012 16:59'
		end
	end
end
