require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before(:each) { visit root_path } # can use :each or not..
    let(:heading)       { 'Sample App' }
    let(:page_title)    { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }

    let(:heading)       { 'Help' }
    let(:page_title)    { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Help') }
  end

  describe "About page" do
    before { visit about_path }
 
    let(:heading)       { 'About us' }
    let(:page_title)    { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| About us') }
  end

  describe "Contact page" do
    before { visit contact_path }

    let(:heading)       { 'Contact' }
    let(:page_title)    { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Contact') }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title(''))  # these don't rly work cos there's something bugging..
    click_link "Help"
    expect(page).to have_title(full_title(''))
    click_link "Contact"
    expect(page).to have_title(full_title(''))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title(''))
    click_link "sample app"
    expect(page).to have_title(full_title(''))
  end
end