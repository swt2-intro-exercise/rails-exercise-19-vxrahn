require 'rails_helper'

describe "Show author page", type: :feature do

  it "should render withour error" do
    visit author_path(@alan)

    expect(page).to have_text('Alan Turing')
  end

end