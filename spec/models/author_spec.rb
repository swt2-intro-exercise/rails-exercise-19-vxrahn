require 'rails_helper'

FIRST_NAME = "Alan"
LAST_NAME = "Turing"
HOMEPAGE = "http://wikipedia.org/Alan_Turing"

describe Author, type: :model do

  it "should have first name, last name, and homepage" do
    author = Author.new( :first_name => FIRST_NAME, :last_name => LAST_NAME, :homepage => HOMEPAGE)

    expect(author.first_name).to eq('Alan')
    expect(author.last_name).to eq('Turing')
    expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')

  end

  it "should return name containing first name and last name" do
    author = Author.new( :first_name => FIRST_NAME, :last_name => LAST_NAME, :homepage => HOMEPAGE)

    expect(author.name).to eq('Alan Turing')
  end


  it "should not validate without last name" do
    author = Author.new( :first_name => FIRST_NAME, :homepage => HOMEPAGE)

    expect(author).to_not be_valid
  end
end