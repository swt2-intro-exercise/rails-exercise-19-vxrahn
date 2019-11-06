require 'rails_helper'

title = "Title"
venue = "mind 49: 433-460"
year = 1950

describe Paper, type: :model do

  it "should have title, venue, and year" do
    paper = Paper.new( :title => title, :venue => venue, :year => year)
    expect(paper.title).to eq(title)
    expect(paper.venue).to eq(venue)
    expect(paper.year).to eq(year)
  end

  it "should not validate without title" do
    paper = Paper.new( :venue => venue, :year => year)
    expect(paper).to_not be_valid
  end
  it "should not validate without venue" do
    paper = Paper.new( :title => title, :year => year)
    expect(paper).to_not be_valid
  end
  it "should not validate without year" do
    paper = Paper.new( :title => title, :venue => venue)
    expect(paper).to_not be_valid
  end
  it "should only validate with numerical year" do
    paper = Paper.new( :title => title, :venue => venue, :year => title)
    expect(paper).to_not be_valid
  end
end
