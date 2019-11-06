require 'rails_helper'

describe "Edit paper page", type: :feature do

  before(:each) do
    @computing = Paper.create(:title => "COMPUTING MACHINERY AND INTELLIGENCE",
                             :venue => "d 49: 433-460",
                             :year => 1968,
                             :authors => [])
    @alan = Author.create( :first_name => "Alan", :last_name => "Turing", :homepage => "test.de")
  end

  it "should render without error" do
    visit edit_paper_path(@computing)
  end

  it "should allow to select paper authors from a multiple select box" do
    visit edit_paper_path(@computing)
    expect(@computing.authors.count).to eq(0)
    page.select 'Alan Turing', from: 'paper[author_ids][]', match: :first
    find('input[type="submit"]').click
    @computing.reload
    expect(@computing.authors.count).to eq(1)

    visit edit_paper_path(@computing)
    page.unselect 'Alan Turing', from: 'paper[author_ids][]', match: :first
    find('input[type="submit"]').click
    @computing.reload
    expect(@computing.authors.count).to eq(0)
  end

end