require 'rails_helper'

describe "Edit paper page", type: :feature do

  before(:each) do
    @computing = FactoryBot.create :paper
  end

  it "should render withour error" do
    visit edit_paper_path(@computing)
  end

  it "should allow to select paper authors from a multiple select box" do
    visit edit_paper_path(@computing)
    expect(@computing.authors.count).to eq(1)
    page.unselect 'Alan Turing', from: 'paper[author_ids][]', match: :first
    find('input[type="submit"]').click
    @computing.reload
    expect(@computing.authors.count).to eq(0)

    visit edit_paper_path(@computing)
    page.select 'Alan Turing', from: 'paper[author_ids][]', match: :first
    find('input[type="submit"]').click
    @computing.reload
    expect(@computing.authors.count).to eq(1)
  end

end