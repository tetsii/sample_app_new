require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe "signup page" do
		before(:each) { visit signup_path }

		it { should have_content('Sign up') }
		it { should have_title(full_title(''))}
		it { should_not have_title('| Sign up')}
	end
end
