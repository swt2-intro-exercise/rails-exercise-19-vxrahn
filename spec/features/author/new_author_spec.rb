require 'rails_helper'

FIRST_NAME = "Edsger"
LAST_NAME = "Dijkstra"
HOMEPAGE = "https://en.wikipedia.org/wiki/Edsger_W._Dijkstra"

describe "New author page", type: :feature do

  it "should render withour error" do
    visit new_author_path
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path

    # these are the standard names given to inputs by the form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should save author" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: FIRST_NAME
    page.fill_in 'author[last_name]', with: LAST_NAME
    page.fill_in 'author[homepage]', with: HOMEPAGE

    find('input[type="submit"]').click
  end

  it "should show validation errors" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: FIRST_NAME
    page.fill_in 'author[homepage]', with: HOMEPAGE

    find('input[type="submit"]').click

    expect(page).to have_text('prohibited this author from being saved')
  end
end