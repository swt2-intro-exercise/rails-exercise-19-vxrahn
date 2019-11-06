require 'rails_helper'

describe "Show paper page", type: :feature do

  before(:each) do
    @computing = FactoryBot.create :paper
  end

  it "should render withour error" do
    visit paper_path(@computing)
  end

  it "should show author full name" do
    visit paper_path(@computing)

    expect(page).to have_text('Alan Turing')
  end

end