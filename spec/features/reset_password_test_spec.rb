require 'spec_helper'

describe "resetting password" do

	it "should reset password" do
		User.destroy_all
		signup("justin@roomsurf.com")
		logout
		click_link "Sign In"
		click_link "Forgot your password?"
		fill_in "Email", :with => "justin@roomsurf.com"
		click_button "Send me reset password instructions"
		open_email("justin@roomsurf.com")
		current_email.save_and_open
		current_email.click_link "Change my password"
		fill_in "New password", :with => "whatever"
		fill_in "Confirm new password", :with => "whatever"
		click_button "Change my password"
		click_link "Sign Out"
		click_link "Sign In"
		fill_in "Email", :with => "justin@roomsurf.com"
		fill_in "Password", :with => "whatever"
		click_button "Sign in"
		expect(page).to have_content("successfully")

	end
end
