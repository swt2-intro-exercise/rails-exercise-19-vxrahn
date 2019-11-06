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

  it "should link to edit author page" do
    visit authors_path

    expect(page).to have_link 'Edit author', href: edit_author_path(@alan)
  end

  it "should have a link to delete an author" do
    visit authors_path
    author_count = Author.count
    find_link("Delete author").click
    expect(Author.count).to be < author_count
  end

end