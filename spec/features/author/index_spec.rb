require 'rails_helper'

describe "Author index page", type: :feature do

  before(:each) do
    @alan = FactoryBot.create :author
  end

  it "should render withour error" do
    visit authors_path
  end

  it "should show author info" do
    visit authors_path

    expect(page).to have_text(@alan.name)
    expect(page).to have_text(@alan.homepage)
    expect(page).to have_link @alan.homepage, href: @alan.homepage

    expect(page).to have_link 'Add author', href: new_author_path
  end

end