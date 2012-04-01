require 'spec_helper'

describe Post do

	describe "Time functions" do

		subject do
			Post.new(:title => "sujet 1", :body => "contenu 1", :author => "vin100", :created_at => Time.new(2012,4,1,13,30,0,"+00:00"), :updated_at => Time.new(2012,8,1,16,59,0,"+00:00"))
		end

		it "Post::created_at_formatted()" do
			subject.created_at_formatted.should == '01/04/2012 13:30'
		end
		
		it "Post::updated_at_formatted()" do
			subject.updated_at_formatted.should == '01/08/2012 16:59'
		end
	end
end
