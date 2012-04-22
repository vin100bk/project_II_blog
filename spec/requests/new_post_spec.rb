require 'spec_helper'

describe "NewPost" do
	context "Connected" do
		before do
			visit new_session_path
		end
	
		describe "GET /posts/new" do
			it "should generates a form for post adding" do
				visit new_post_path
				page.should have_selector(:xpath, '//form[@action="/posts" and @method="post"]')
			end
		end
	
		describe "POST /posts" do
			it "should register a new post" do
				visit new_post_path
				fill_in('post_title', :with => 'My post')
				fill_in('post_body', :with => 'Content of my first post !')
				click_button('Save')
				page.current_path.should == root_path
				page.should have_content('Post successfully added')
				page.should have_content 'My post'
				page.should have_content 'Content of my first post !'
				page.should have_content 'test'
			end
		
			it "should display error while registring a wrong post" do
				visit new_post_path
				fill_in('post_body', :with => 'Content of my first post !')
				click_button('Save')
				page.should have_content('Error while post registring')
				page.should have_content('can\'t be blank')
			end
		end
	end
	
	context "Not connected" do
		describe "GET /posts/new" do
			it "should redirect and display an error message" do
				visit new_post_path
				page.current_path.should == root_path
				page.should have_content 'You should be registered to add a post.'
			end
		end
	end
end
