require 'rails_helper'

describe "Paper index page", type: :feature do

  before(:each) do
    @test1950 = Paper.create(:title => "COMPUTING MACHINERY AND INTELLIGENCE",
                         :venue => "d 49: 433-460",
                         :year => 1950,
                         :authors => [])
    @test1968 = Paper.create(:title => "TEST MACHINERY AND INTELLIGENCE",
                      :venue => "d 49: 433-460",
                      :year => 1968,
                      :authors => [])
  end

  it "should render withour error" do
    visit papers_path
  end

  it "should show allow filtering papers by year" do
    visit papers_path

    expect(page).to have_text(@test1950.title)
    expect(page).to have_text(@test1968.title)

    visit papers_path(:year => 1950)

    expect(page).to have_text(@test1950.title)
    expect(page).to_not have_text(@test1968.title)

    visit papers_path(:year => 1968)

    expect(page).to_not have_text(@test1950.title)
    expect(page).to have_text(@test1968.title)
  end

end