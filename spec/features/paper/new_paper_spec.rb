require 'rails_helper'

describe "New paper page", type: :feature do

  it "should render without error" do
    visit new_paper_path
  end

end