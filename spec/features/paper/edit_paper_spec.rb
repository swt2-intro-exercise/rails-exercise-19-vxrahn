require 'rails_helper'

describe "Edit paper page", type: :feature do

  before(:each) do
    @alan = FactoryBot.create :author
    @computing = FactoryBot.create :paper
  end

  it "should render withour error" do
    visit edit_paper_path(@computing)
  end

  it "should allow to select paper authors from a multiple select box" do
    visit edit_paper_path(@computing)
    expect(@computing.authors.count).to eq(1)
    page.unselect @alan, from: 'author_ids'
    find('input[type="submit"]').click
    @computing.reload
    expect(@computing.authors.count).to eq(0)
  end

end