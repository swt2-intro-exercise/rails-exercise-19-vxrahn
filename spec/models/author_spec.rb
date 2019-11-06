require 'rails_helper'

first_name = "Alan"
last_name = "Turing"
homepage = "http://wikipedia.org/Alan_Turing"

describe Author, type: :model do

  it "should have first name, last name, and homepage" do
    author = Author.new( :first_name => first_name, :last_name => last_name, :homepage => homepage)
    expect(author.first_name).to eq(first_name)
    expect(author.last_name).to eq(last_name)
    expect(author.homepage).to eq(homepage)
  end

  it "should return name containing first name and last name" do
    author = Author.new( :first_name => first_name, :last_name => last_name, :homepage => homepage)
    expect(author.name).to eq(first_name + ' ' + last_name)
  end

  it "should not validate without last name" do
    author = Author.new( :first_name => first_name, :homepage => homepage)
    expect(author).to_not be_valid
  end
end